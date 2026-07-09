import React from 'react';
import Home from './home';
import Header from '@/components/layouts/header.layout';
import Footer from '@/components/layouts/footer.layout';

const App = () => {
  return (
    <div>
      <h2>App</h2>
      <Header />
      <Home/>
      <Footer />
    </div>
  );
};

export default App;