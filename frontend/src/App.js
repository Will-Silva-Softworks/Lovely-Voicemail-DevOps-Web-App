import React, { useEffect } from 'react';

function App() {
  useEffect(() => {
    window.location.replace('https://linktr.ee/lovelyvoicemail');
  }, []);

  return (
    <div style={{ textAlign: 'center', padding: '2rem', fontFamily: 'sans-serif' }}>
      Redirecting to Linktree...
    </div>
  );
}

export default App;