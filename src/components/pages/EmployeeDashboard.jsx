import { Paper, Typography } from "@mui/material"
import { DataGrid } from "@mui/x-data-grid"
import { supabase } from "../../supabase/supabaseClient"
import { useState, useEffect } from "react"

function EmployeeDashboard() {

  const [employees, setEmployees] = useState()

  // Get all data on page load
  useEffect(() => {
  
    async function fetchEmployees() {
      
      const { data, error } = await 
      
      supabase
        .from('Employees')
        .select('*')

      if (error) console.error(error)
      if (data) setEmployees(data)
      
    }

    fetchEmployees()

  }, [])

  // Subscribe to changes of data
  // useEffect(() => {
    
  //   const subscription = supabase
  //     .from('Employees')
  //     .on('*', payload => {
  //       setEmployees(payload.new)
  //     })
  //     .subscribe()

  //   return () => subscription.unsubscribe()

  // }, [])

  return (
    <>
      <br/>
      <Typography variant="h4" component="h1">Employee Dashboard</Typography>
      <br/>
      <Paper>
        <DataGrid columns={[]}/>
      </Paper>
    </>
  )
}

export default EmployeeDashboard
