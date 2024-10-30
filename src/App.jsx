import '@fontsource/roboto/300.css'
import '@fontsource/roboto/400.css'
import '@fontsource/roboto/500.css'
import '@fontsource/roboto/700.css'
import './App.css'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { Container, createTheme, CssBaseline, ThemeProvider, useMediaQuery } from '@mui/material'
import EmployeeDashboard from './components/pages/EmployeeDashboard'

const darkTheme = createTheme({
  colorSchemes: {
    dark: true,
  }
})

const lightTheme = createTheme({
  colorSchemes: {
    light: true,
  }
})

function App() {

  const prefersDarkMode = useMediaQuery('(prefers-color-scheme: dark)')

  return (
    <ThemeProvider theme={prefersDarkMode ? darkTheme : lightTheme}>
      <CssBaseline />
      <BrowserRouter>
        <Container>

          <Routes>
            <Route path="/" element={<EmployeeDashboard />} />
          </Routes>

        </Container>
      </BrowserRouter>
    </ThemeProvider>
  )
}

export default App
