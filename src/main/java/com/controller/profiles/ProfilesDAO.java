package com.controller.profiles;
import java.util.List;

public interface ProfilesDAO {

	
	public void insert( Profiles p );
	public void update( Profiles p );
	public void delete( int pid );

	public List<Profiles> getAllProfiles();
	public Profiles getProfilesbyId(int pid);
	public Profiles getProfilesbyEmail(String email);
   
	public List<Profiles> getAllEmail();
	
}
