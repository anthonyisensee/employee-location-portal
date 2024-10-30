import '@fontsource/roboto/300.css'
import '@fontsource/roboto/400.css'
import '@fontsource/roboto/500.css'
import '@fontsource/roboto/700.css'
import './App.css'
import { BrowserRouter } from 'react-router-dom'
import { Container, createTheme, CssBaseline, ThemeProvider, Typography, useMediaQuery } from '@mui/material'

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
          <Typography variant="h4" component="h1">Employee Location Portal</Typography>
          <Typography variant="body1">Welcome to the employee location portal application!</Typography>
        </Container>      
      </BrowserRouter>
    </ThemeProvider>
  )
}

export default App
