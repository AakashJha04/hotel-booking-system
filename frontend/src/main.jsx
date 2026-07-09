import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import { Button } from '@/components/ui/button'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <div className="flex min-h-screen flex-col items-center justify-center gap-4">
      <h1 className="text-3xl font-bold">Hello World</h1>
      <Button>shadcn is working</Button>
    </div>
  </StrictMode>,
)
