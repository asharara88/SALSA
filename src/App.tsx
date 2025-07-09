import React from 'react'
import SupplementsPage from './components/supplements/SupplementsPage'
import EnhancedOnboardingForm from './components/onboarding/EnhancedOnboardingForm'

function App() {
  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <h1 className="text-3xl font-bold text-gray-900">BioWell.ai</h1>
          <p className="text-gray-600">Your Personal Health & Wellness Dashboard</p>
        </div>
      </header>
      
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <div>
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">Supplements</h2>
            <SupplementsPage />
          </div>
          
          <div>
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">Health Onboarding</h2>
            <EnhancedOnboardingForm />
          </div>
        </div>
      </main>
    </div>
  )
}

export default App
