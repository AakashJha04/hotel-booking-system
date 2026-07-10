import { Button } from '@/components/ui/button'
import React from 'react'

const HeroSection = () => {
  return (
    <section className="relative min-h-[372px] bg-black">
      <img className="absolute size-full z-[1] max-w-[1440px] mx-auto object-cover inset-0" src="./assets/hero-image-1440.jpeg" alt="Booking.com Hero Section" />
      <div className="absolute inset-0 z-[1] max-w-[1440px] mx-auto bg-gradient-to-t from-black/70 via-black/20 to-transparent" />
      <div className="z-[2] relative container py-2">
        <h1 className="mt-4 text-4xl font-extrabold leading-tight text-white drop-shadow-md md:text-5xl">Welcome to <br/> Our Travel Site</h1>
        <p className="text-xl font-medium leading-snug text-white drop-shadow-sm md:text-2xl">Discover amazing destinations and plan your next adventure.</p>
        <Button className="mt-8 h-12 px-4 text-base font-semibold cursor-pointer shadow-lg">Explore Now</Button>
      </div>
    </section>
  )
}

export default HeroSection
