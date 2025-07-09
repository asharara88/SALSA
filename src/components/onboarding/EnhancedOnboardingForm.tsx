import React from 'react';
import Button from '../ui/Button';

export interface EnhancedOnboardingFormProps {
  onSubmit?: () => void;
}

export const EnhancedOnboardingForm: React.FC<EnhancedOnboardingFormProps> = ({ onSubmit }) => (
  <form onSubmit={e => { e.preventDefault(); onSubmit?.(); }}>
    {/* Simple placeholder form */}
    <Button type="submit" label="Continue" />
  </form>
);

export default EnhancedOnboardingForm;
