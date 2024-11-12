import { Paper, Typography } from "@mui/material"
import { DataGrid } from "@mui/x-data-grid"
import { supabase } from "../../supabase/supabaseClient"
import { useState, useEffect } from "react"

const employeeColumns = [
  { field: "first_name", headerName: "First Name" },
  { field: "last_name", headerName: "Last Name" },
]

function EmployeeDashboard() {

  const [employees, setEmployees] = useState()

  // Get all data on page load
  useEffect(() => {
  
    async function fetchEmployees() {
      
      const { data, error } = await supabase
        .from('Employees')
        .select('*')

      if (error) console.error(error)
      if (data) setEmployees(data)

      console.log(data)
      
    }

    fetchEmployees()

  }, [])

  // Subscribe to changes of data
  useEffect(() => {
    
    const channel = supabase
      .channel('employee-changes')
      .on('postgres_changes', 
        { event: "*", schema: "public", table: "Employees" }, 
        payload => {
          
          console.log(payload)

          switch (payload.eventType) {
            
            case "INSERT":
              setEmployees(prevEmployees => [...prevEmployees, payload.new])
              break

            case "UPDATE":
              setEmployees(prevEmployees => prevEmployees.map(emp => emp.id === payload.new.id ? payload.new : emp))
              break

            case "DELETE":
              setEmployees(prevEmployees => prevEmployees.filter(emp => emp.id !== payload.old.id))
              break
            
            default:
              break
            
          }
        }
      )
      .subscribe()

    return () => supabase.removeChannel(channel)

  }, [])

  return (
    <>
      <br/>
      <Typography variant="h4" component="h1">Employee Dashboard</Typography>
      <br/>
      <Paper>
        <DataGrid columns={employeeColumns} rows={employees} checkboxSelection/>
      </Paper>
    </>
  )
}

export default EmployeeDashboard
