import React from 'react'
import { FOOTER_SECTION } from '@/config/app.config'
import { SOCIAL_LINKS } from '@/config/app.config'
import Icon from '@/components/ui/icon'
import dayjs from 'dayjs'

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
                  <a href={link.href} className='text-sm hover:underline'>
                    {link.text}
                  </a>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </footer>
    <div className='bg-brand py-4'>
      <div className="container flex items-center justify-between gap-4">
        <div className="flex items-center gap-4">
          {SOCIAL_LINKS.map((link, index) => (
            <a key={index} href={link.href} className='text-white hover:text-gray-300'>
              <Icon icon={link.icon} />
            </a>
          ))}
        </div>

        <p className='text-sm text-white'>
          &copy; {dayjs().year()} Your Company. All rights reserved.
        </p>
      </div>
    </div>
  </div>)
}

export default Footer
