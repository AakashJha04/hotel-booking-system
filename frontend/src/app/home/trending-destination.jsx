import React from 'react'
import { TRENDING_DESTINATIONS } from '@/config/app.config'
import { cn, getAssetPath } from '@/lib/utils'

const TrendingDestination = () => {
  return (
    <div className="container my-16">
      <div className="mb-4 space-y-1">
        <h2 className="text-3xl font-bold">Trending Destinations</h2>
        <p className="text-lg text-muted-foreground">Most popular destinations for travelers</p>
      </div>

      <div className="grid grid-cols-6 gap-4">
        {TRENDING_DESTINATIONS.map((destination, index) => (
          <div key={index}
            className={cn('h-[270px] rounded-lg overflow-hidden relative shadow-md transition-shadow hover:shadow-lg group', destination.className)}
          >
            <img
              src={getAssetPath(destination.image)}
              alt={destination.title}
              className="object-cover size-full rounded-lg transition-transform duration-300 group-hover:scale-105"
            />
            <div className="absolute from-60% to-100% inset-0 size-full bg-gradient-to-t from-transparent to-black/70 ">
              <div className='p-3'>
                <h3 className='text-xl font-bold text-white drop-shadow-sm'>{destination.title}</h3>
              </div>
            </div>
          </div>
        ))}

      </div>
    </div>
  )
}

export default TrendingDestination