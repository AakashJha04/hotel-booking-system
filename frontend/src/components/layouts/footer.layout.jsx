import React from 'react'
import { FOOTER_SECTION } from '@/config/app.config'

const Footer = () => {
  return (<div className='bg-secondary'>
    <footer className="container py-8">
      <div className='grid grid-cols-[repeat(auto-fill,_minmax(190px,_1fr))] py-4 gap-6'>
        {FOOTER_SECTION.map((section, index) => (
          <div key={index} className='flex flex-col gap-4'>
            <h3 className='text-sm font-bold'>{section.title}</h3>
            <ul>
              {section.links.map((link, linkIndex) => (
                <li key={linkIndex} >
                  <a href={link.href} target="_blank" rel="noopener noreferrer">
                    {link.text}
                  </a>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </footer>
  </div>)
}

export default Footer
