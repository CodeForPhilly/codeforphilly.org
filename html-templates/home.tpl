{extends designs/site.tpl}

{block header}
	<div class="heroimage-and-caption">
		<img class="heroimage2" src="./img/philly-skyline.jpg" alt="" />
		<div class="container">
			<div class="caption members-signed-in">
				<h1>We are Code for Philly</h1>
				
				{$latestUpdates = ProjectUpdate::getAll(array(limit=>2, order=>array(ID=>DESC)))}
				{if $latestUpdates}
					<h2>Latest project updates:</h2>
					{foreach item=Update from=$latestUpdates}
					<p>
						{$Update->Body|truncate:60}
						<strong>
							<a href="/projects/{$Update->Project->Handle}/updates/{$Update->Number}">#{$Update->Number}</a>
							in <a href="/projects/{$Update->Project->Handle}">{$Update->Project->Title|escape}</a>
						</strong>
					</p>
					{/foreach}
				{/if}

				<a class="btn btn-large btn-primary" href="/projects">Check out our projects</a>

				{if first}
					<h2>Members checked-in:</h2>
				{/if}

				<ul>
					{foreach item=Member from=MemberCheckin::getCurrentMembers()}
						<li>{memberLink $Member avatar=20 showName=false}</li>
					{/foreach}

					{if $.User}
					<li>
						{if $.User->OpenCheckin}
							<form action="/members/{$.User->Username}/checkout" method="POST" style="display: inline">
								<input type="submit" value="Check Out" class="btn btn-warning">
							</form>
						{else}
							<form action="/members/{$.User->Username}/checkin" method="POST" style="display: inline">
								<input type="submit" value="Check In" class="btn btn-success">
							</form>
						{/if}
					</li>
					{/if}
				</ul>
			</div>
		</div>
	</div>
{/block}

{block content}
	<!-- Three columns of text below the carousel -->
	<div class="row marketing">
		<div class="span4">
			<img src="/img/members-logo-red.jpg" />
			<h2>Members</h2>
			<p>Code for Philly is an open group of local citizens that are compelled to improve their city.</p>
			<p>We welcome developers, artists, designers, community organizers, and project managers&mdash;or anyone with something to contribute.</p>

			{$latestMember = Member::getByWhere(array(Class=>Member), array(order=>array(ID=>DESC)))}
			{if $latestMember}
				<h3>Newest Member</h3>
				{memberLink $latestMember}
			{/if}

			<p><a class="small-button" href="/members">View all members &raquo;</a></p>
		</div>
		<!-- /.span4 -->
		<div class="span4">
			<img src="/img/meetup-logo-red.jpg" />
			<h2>Meetups</h2>
			<p>We host weekly workshops that are open to the public along with other fun and strategic events to advance technology in our city and communities.</p>

			{$meetups = Meetup::getEvents()}
			{if count($meetups)}
				<h3>Next Meetup</h3>
				{meetup $meetups[0]}
			{/if}

			<p><a class="small-button" href="http://www.meetup.com/Code-for-America-Philly/">View all scheduled events &raquo;</a></p>
		</div>
		<!-- /.span4 -->
		<div class="span4">
			<img src="/img/code-for-america-logo-red.jpg" />
			<h2>Our Inspiration</h2>
			<p>Code for America is a non-partisan, non-political 501(c)3 organization founded in 2009 to bring web-industry professionals to work with city governments in the United States in order to promote <strong>openness</strong>, <strong>participation</strong>, and <strong>efficiency</strong> in municipal governments</p>
			<p><a class="small-button" href="http://codeforamerica.org/">Visit CodeForAmerica.org &raquo;</a></p>
		</div>
		<!-- /.span4 -->
	</div>
	<!-- /.row -->
{/block}