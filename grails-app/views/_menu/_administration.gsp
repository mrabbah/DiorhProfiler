<li class="dropdown dropdown-btn">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		Administration<b class="caret"></b>
	</a>
	
	<ul class="dropdown-menu">
		<%-- Note: Links to pages without controller are redirected in conf/UrlMappings.groovy --%>
		<li class="">
			<a href="${createLink(uri: '/utilisateur/create')}">
				Utilisateur
			</a>
		</li>
		<li class="">
			<a href="${createLink(uri: '/profil/index')}">
				Profil
			</a>
		</li>
	</ul>
</li>
