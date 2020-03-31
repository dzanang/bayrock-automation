shared_context 'Delete job' do
  context 'Deleting the newly added job' do
    it 'Newly added job deleted' do
      jobpage.delete_job job['job_name']
      sleep 5
    end

    it 'Confirmed deletion' do
      expect(jobpage.check_automation_job_added(job['job_name'])).to be false
    end
  end
end
