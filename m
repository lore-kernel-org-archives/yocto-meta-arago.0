Return-Path: <rsivarajan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 394D852990
	for <meta-arago@arago-project.org>;
	Tue, 13 Aug 2013 12:43:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7DCh9GA010198
	for <meta-arago@arago-project.org>; Tue, 13 Aug 2013 07:43:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7DCh9Ij014282;
	Tue, 13 Aug 2013 07:43:09 -0500
Received: from DFLE10.ent.ti.com ([fe80::e166:23b9:9a46:8b60]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 13 Aug 2013 07:43:09 -0500
From: "Sivarajan, Raj" <rsivarajan@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [ARES] Re: [meta-arago] help needed: Top nightly failure
Thread-Index: AQHOlKVhYLg47SS+BkWk6SF4jhxQiAFZkRkAAKcjMsAAAxtF4AAMfynAmYH/ZgCAAAP7gIAAHVMAgAATTACAAAOogIAAYMbg
Importance: high
X-Priority: 1
Date: Tue, 13 Aug 2013 12:43:07 +0000
Message-ID: <202014BC5B10CF4DB0A8DED00E5797FD0C57FFDD@DFLE10.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F4905493EC54@DLEE11.ent.ti.com>
	<20130809020846.GF25015@edge>
	<4F9216F96E5DF9428610502835A9F4905494E746@DLEE11.ent.ti.com>
	<20130812223119.GB30860@edge>
	<8F29D6B095ED194EA1980491A5E029710C51A5BC@DFLE08.ent.ti.com>
	<8EAE6244CE843044A42356038645C8551574CEB8@DFLE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C51A6C2@DFLE08.ent.ti.com>
	<20130813015241.GE30860@edge>
In-Reply-To: <20130813015241.GE30860@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "ares-team@list.ti.com - Raj Sivarajan's Team \(May contain non-TIers\)"
	<ares-team@list.ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Mills, William" <wmills@ti.com>, "Trivedi, Gaurang" <gtrivedi@ti.com>
Subject: Re: [ARES] Re: help needed: Top nightly failure
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2013 12:43:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys, Franklin,

Thanks for the suggestions. Sam was trying to manually download the failing=
 packages to the local mirror yesterday, but last night's build failed as w=
ell.

One question is what happened Thursday/Friday to start causing this problem=
? The nightly builds were running successfully prior to that day.

Is there someone we can contact to help? This is a production stop for a Be=
ta release that is going to partners for the Ericsson/EPiC CI project, so i=
t is urgent.

Thanks,
Raj
_________________________________________________________
Type "http://mcsdk" to get to MCSDK internal landing page
(useful links: Support path, Active Customer Issues)

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, August 12, 2013 9:53 PM
To: Cooper Jr., Franklin
Cc: Saran, Sajesh Kumar; Nelson, Sam; meta-arago@arago-project.org; ares-te=
am@list.ti.com - Raj Sivarajan's Team (May contain non-TIers)
Subject: [ARES] Re: [meta-arago] help needed: Top nightly failure

Same here - my git clones I started earlier did not fail. I am trying it ou=
tside of TI network, so not going through the proxy. But I'm not seeing any=
thing wrong with the arago server.

--
Denys


On Mon, Aug 12, 2013 at 09:39:36PM -0400, Cooper Jr., Franklin wrote:
> I don't know if there is more history regarding this issue but for what i=
t's=20
> worth I was able to execute the command I mentioned in the previous email=
. I=20
> would be happy to upload it so you can copy it to your download directory=
 to=20
> work around this issue for the time being.
>=20
> > -----Original Message-----
> > From: Saran, Sajesh Kumar
> > Sent: Monday, August 12, 2013 7:31 PM
> > To: Cooper Jr., Franklin; Dmytriyenko, Denys; Nelson, Sam
> > Cc: meta-arago@arago-project.org; ares-team@list.ti.com - Raj Sivarajan=
's
> > Team (May contain non-TIers)
> > Subject: RE: [meta-arago] help needed: Top nightly failure
> >=20
> > This is a reproducible issue. I guess git cloning from arago-project is=
 a problem.
> > I got another e-mail (attached) that cloning of linux-davinci is also h=
ave similar
> > issue.
> >=20
> > Regards,
> > Sajesh
> >=20
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Monday, August 12, 2013 6:46 PM
> > To: Dmytriyenko, Denys; Nelson, Sam
> > Cc: meta-arago@arago-project.org; ares-team@list.ti.com - Raj Sivarajan=
's
> > Team (May contain non-TIers)
> > Subject: [ARES] RE: [meta-arago] help needed: Top nightly failure
> >=20
> > If this is blocking your release and your able to clone locally you cou=
ld also
> > workaround this issue by cloning it manually and then placing it in you=
r
> > downloads directory.
> > Based on your log bitbake is simply running the following command so yo=
u can
> > run this command manually:
> > git clone --bare --mirror git://arago-project.org/git/projects/linux-tc=
i6614.git
> > /home/a0756824/sc_mcsdk/oe-layersetup-mcsdk/downloads/git2/arago-
> > project.org.git.projects.linux-tci6614.git
> >=20
> >=20
> >=20
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > > Sent: Monday, August 12, 2013 5:31 PM
> > > To: Nelson, Sam
> > > Cc: meta-arago@arago-project.org; ares-team@list.ti.com - Raj
> > > Sivarajan's Team (May contain non-TIers)
> > > Subject: Re: [meta-arago] help needed: Top nightly failure
> > >
> > > Sam,
> > >
> > > I have already mentioned many times that you should use a mirror...
> > >
> > > I don't see any problems with the server and I'm cloning your trees
> > > right now w/o problems so far. You may want to check your proxy setup=
 as
> > well.
> > >
> > > BTW, did repacking the linux-keystone help for your nightlies? I can
> > > do the same for linux-tci6614 too...
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Mon, Aug 12, 2013 at 06:22:11PM -0400, Nelson, Sam wrote:
> > > > Denys,
> > > > This is blocking the MCSDK 3.0.2 & SCMCSDK-2.2.0 releases and
> > > > appreciate
> > > any
> > > > help in resolving this issue.
> > > >
> > > > With regards,
> > > > Sam
> > > >
> > > > -----Original Message-----
> > > > From: Nelson, Sam
> > > > Sent: Monday, August 12, 2013 12:27 PM
> > > > To: Dmytriyenko, Denys
> > > > Cc: 'meta-arago@arago-project.org'; Sivarajan, Raj;
> > > > ares-team@list.ti.com -
> > > Raj Sivarajan's Team (May contain non-TIers)
> > > > Subject: RE: help needed: Top nightly failure
> > > >
> > > > Also  yocto builds using
> > > > git://arago-project.org/git/projects/linux-tci6614.git
> > > also failing for the past 3 days.
> > > >
> > > > Looks like there is no issue in cloning the repos. But only the
> > > > yocto fetch
> > > operation is failing.
> > > >
> > > > From the logs there is no information about what is the actual
> > > > command ,
> > > which failed.
> > > > With regards,
> > > > Sam
> > > > -----Original Message-----
> > > > From: Nelson, Sam
> > > > Sent: Monday, August 12, 2013 10:57 AM
> > > > To: Dmytriyenko, Denys
> > > > Cc: meta-arago@arago-project.org; Sivarajan, Raj;
> > > > ares-team@list.ti.com - Raj
> > > Sivarajan's Team (May contain non-TIers)
> > > > Subject: RE: help needed: Top nightly failure
> > > > Importance: High
> > > >
> > > > Hello Denys,
> > > > Now starting Thursday, our builds are failing now consistently.
> > > > Did something change in the repos?
> > > > WARNING: Failed to fetch URL
> > > > git://arago-project.org/git/projects/linux-
> > > keystone.git;protocol=3Dgit;branch=3Dcurrent/master, attempting MIRRO=
RS if
> > > available
> > > > ERROR: Fetcher failure: Fetch command failed with exit code 128, ou=
tput:
> > > > Cloning into bare repository '/home/a0862859/yocto/oe-layersetup-
> > > mcsdk/downloads/git2/arago-project.org.git.projects.linux-keystone.gi=
t'...
> > > >
> > > > fatal: The remote end hung up unexpectedly
> > > > fatal: early EOF
> > > > fatal: index-pack failed
> > > >
> > > > ERROR: Function failed: Fetcher failure for URL: 'git://arago-
> > > project.org/git/projects/linux-
> > > keystone.git;protocol=3Dgit;branch=3Dcurrent/master'. Unable to fetch=
 URL
> > > from any source.
> > > > ERROR: Logfile of failure stored in:
> > > > /home/a0862859/yocto/oe-layersetup-
> > > mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-
> > > linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.31058
> > > > ERROR: Task 684 (/home/a0862859/yocto/oe-layersetup-
> > > mcsdk/sources/meta-ti/recipes-kernel/linux/linux-keystone_3.8.4.bb,
> > > do_fetch) failed with exit code '1'
> > > > NOTE: Tasks Summary: Attempted 3212 tasks of which 3211 didn't need
> > > > to be
> > > rerun and 1 failed.
> > > > No currently running tasks (351 of 3340)
> > > >
> > > > With regards,
> > > > Sam
> > > >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Thursday, August 08, 2013 10:09 PM
> > > > To: Nelson, Sam
> > > > Cc: meta-arago@arago-project.org; Sivarajan, Raj
> > > > Subject: Re: help needed: Top nightly failure
> > > >
> > > > Sam,
> > > >
> > > > Please use a mirror and/or previously cloned repos from downloads/
> > > > directory
> > > - cloning the entire tree every night is not recommended and is rathe=
r abusive.
> > > >
> > > > Also, I've repacked the linux-keystone repository so it is now
> > > > smaller - please
> > > let me know if you still see the problem.
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > On Fri, Aug 02, 2013 at 06:20:08AM -0400, Nelson, Sam wrote:
> > > > >    Hello All
> > > > >
> > > > >
> > > > >
> > > > >    We are encountering a lot of nightly failures with fetch failu=
re like the
> > > > >    following from the arago-project git.  The error happens rando=
mly and
> > > > >    unpredictably.
> > > > >
> > > > >    Is this something to do with git servers going down/offline?
> > > > >
> > > > >    Any ideas in tracking this type of issue will be appreciated.
> > > > >
> > > > >
> > > > >
> > > > >    With regards,
> > > > >
> > > > >    Sam
> > > > >
> > > > >
> > > > >
> > > > >    ERROR: Fetcher failure: Fetch command failed with exit code 12=
8,
> > output:
> > > > >
> > > > >    Cloning into bare repository
> > > > >    '/home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-
> > > mcsdk/downloads/git2/arago-project.org.git.projects.linux-keystone.gi=
t'...
> > > > >
> > > > >
> > > > >
> > > > >    fatal: The remote end hung up unexpectedly
> > > > >
> > > > >    fatal: early EOF
> > > > >
> > > > >    fatal: index-pack failed
> > > > >
> > > > >
> > > > >
> > > > >    ERROR: Function failed: Fetcher failure for URL:
> > > > >    'git://arago-project.org/git/projects/linux-
> > > keystone.git;protocol=3Dgit;branch=3Djuly-2013b/master'.
> > > > >    Unable to fetch URL from any source.
> > > > >
> > > > >    ERROR: Logfile of failure stored in:
> > > > >    /home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-
> > > mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-
> > > linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.14929
> > > > >
> > > > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

