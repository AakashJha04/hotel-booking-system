import React from 'react'
import { Button } from '../ui/button'

const Header = () => {
  return (
    <header className="bg-brand py-2">
      
      <div className="container flex items-center justify-between">
        
        <div id="logo-wrapper">
          <a href="#" aria-label="Go to Booking.com">
            <img width={144} height={24} src="/assets/booking.com.svg" alt="Logo of Booking.com"/>
          </a>
        </div>

        <div id="auth" className="flex gap-2 justify-center items-center">
          <Button className="bg-white cursor-pointer border-primary text-brand hover:bg-gray-200">Register</Button>
          <Button className="bg-brand cursor-pointer border-primary text-white hover:bg-blue-700">Login</Button>
        </div>

      </div>

    </header>
  )
}

export default Header
