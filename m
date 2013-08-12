Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 03B3652A5F
	for <meta-arago@arago-project.org>;
	Mon, 12 Aug 2013 22:45:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7CMjbaU013183
	for <meta-arago@arago-project.org>; Mon, 12 Aug 2013 17:45:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7CMjblP005036;
	Mon, 12 Aug 2013 17:45:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 12 Aug 2013 17:45:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] help needed: Top nightly failure
Thread-Index: Ac6PaQWKy78HI/DYT4asbnLR1JblhgFZkRkAAKcjMsAAAxtF4AAMfynAAArUyQAACjlIsA==
Date: Mon, 12 Aug 2013 22:45:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C51A5BC@DFLE08.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F4905493EC54@DLEE11.ent.ti.com>
	<20130809020846.GF25015@edge>
	<4F9216F96E5DF9428610502835A9F4905494E746@DLEE11.ent.ti.com>
	<20130812223119.GB30860@edge>
In-Reply-To: <20130812223119.GB30860@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"ares-team@list.ti.com - Raj Sivarajan's Team \(May contain non-TIers\)"
	<ares-team@list.ti.com>
Subject: Re: help needed: Top nightly failure
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
X-List-Received-Date: Mon, 12 Aug 2013 22:45:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If this is blocking your release and your able to clone locally you could a=
lso workaround this issue by cloning it manually and then placing it in you=
r downloads directory.
Based on your log bitbake is simply running the following command so you ca=
n run this command manually:
git clone --bare --mirror git://arago-project.org/git/projects/linux-tci661=
4.git /home/a0756824/sc_mcsdk/oe-layersetup-mcsdk/downloads/git2/arago-proj=
ect.org.git.projects.linux-tci6614.git=20



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, August 12, 2013 5:31 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org; ares-team@list.ti.com - Raj Sivarajan's
> Team (May contain non-TIers)
> Subject: Re: [meta-arago] help needed: Top nightly failure
>=20
> Sam,
>=20
> I have already mentioned many times that you should use a mirror...
>=20
> I don't see any problems with the server and I'm cloning your trees right=
 now
> w/o problems so far. You may want to check your proxy setup as well.
>=20
> BTW, did repacking the linux-keystone help for your nightlies? I can do t=
he same
> for linux-tci6614 too...
>=20
> --
> Denys
>=20
>=20
> On Mon, Aug 12, 2013 at 06:22:11PM -0400, Nelson, Sam wrote:
> > Denys,
> > This is blocking the MCSDK 3.0.2 & SCMCSDK-2.2.0 releases and appreciat=
e
> any
> > help in resolving this issue.
> >
> > With regards,
> > Sam
> >
> > -----Original Message-----
> > From: Nelson, Sam
> > Sent: Monday, August 12, 2013 12:27 PM
> > To: Dmytriyenko, Denys
> > Cc: 'meta-arago@arago-project.org'; Sivarajan, Raj; ares-team@list.ti.c=
om -
> Raj Sivarajan's Team (May contain non-TIers)
> > Subject: RE: help needed: Top nightly failure
> >
> > Also  yocto builds using git://arago-project.org/git/projects/linux-tci=
6614.git
> also failing for the past 3 days.
> >
> > Looks like there is no issue in cloning the repos. But only the yocto f=
etch
> operation is failing.
> >
> > From the logs there is no information about what is the actual command =
,
> which failed.
> > With regards,
> > Sam
> > -----Original Message-----
> > From: Nelson, Sam
> > Sent: Monday, August 12, 2013 10:57 AM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org; Sivarajan, Raj; ares-team@list.ti.com=
 - Raj
> Sivarajan's Team (May contain non-TIers)
> > Subject: RE: help needed: Top nightly failure
> > Importance: High
> >
> > Hello Denys,
> > Now starting Thursday, our builds are failing now consistently.
> > Did something change in the repos?
> > WARNING: Failed to fetch URL git://arago-project.org/git/projects/linux=
-
> keystone.git;protocol=3Dgit;branch=3Dcurrent/master, attempting MIRRORS i=
f
> available
> > ERROR: Fetcher failure: Fetch command failed with exit code 128, output=
:
> > Cloning into bare repository '/home/a0862859/yocto/oe-layersetup-
> mcsdk/downloads/git2/arago-project.org.git.projects.linux-keystone.git'..=
.
> >
> > fatal: The remote end hung up unexpectedly
> > fatal: early EOF
> > fatal: index-pack failed
> >
> > ERROR: Function failed: Fetcher failure for URL: 'git://arago-
> project.org/git/projects/linux-
> keystone.git;protocol=3Dgit;branch=3Dcurrent/master'. Unable to fetch URL=
 from
> any source.
> > ERROR: Logfile of failure stored in: /home/a0862859/yocto/oe-layersetup=
-
> mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-
> linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.31058
> > ERROR: Task 684 (/home/a0862859/yocto/oe-layersetup-
> mcsdk/sources/meta-ti/recipes-kernel/linux/linux-keystone_3.8.4.bb, do_fe=
tch)
> failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 3212 tasks of which 3211 didn't need to =
be
> rerun and 1 failed.
> > No currently running tasks (351 of 3340)
> >
> > With regards,
> > Sam
> >
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, August 08, 2013 10:09 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org; Sivarajan, Raj
> > Subject: Re: help needed: Top nightly failure
> >
> > Sam,
> >
> > Please use a mirror and/or previously cloned repos from downloads/ dire=
ctory
> - cloning the entire tree every night is not recommended and is rather ab=
usive.
> >
> > Also, I've repacked the linux-keystone repository so it is now smaller =
- please
> let me know if you still see the problem.
> >
> > --
> > Denys
> >
> >
> > On Fri, Aug 02, 2013 at 06:20:08AM -0400, Nelson, Sam wrote:
> > >    Hello All
> > >
> > >
> > >
> > >    We are encountering a lot of nightly failures with fetch failure l=
ike the
> > >    following from the arago-project git.  The error happens randomly =
and
> > >    unpredictably.
> > >
> > >    Is this something to do with git servers going down/offline?
> > >
> > >    Any ideas in tracking this type of issue will be appreciated.
> > >
> > >
> > >
> > >    With regards,
> > >
> > >    Sam
> > >
> > >
> > >
> > >    ERROR: Fetcher failure: Fetch command failed with exit code 128, o=
utput:
> > >
> > >    Cloning into bare repository
> > >    '/home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-
> mcsdk/downloads/git2/arago-project.org.git.projects.linux-keystone.git'..=
.
> > >
> > >
> > >
> > >    fatal: The remote end hung up unexpectedly
> > >
> > >    fatal: early EOF
> > >
> > >    fatal: index-pack failed
> > >
> > >
> > >
> > >    ERROR: Function failed: Fetcher failure for URL:
> > >    'git://arago-project.org/git/projects/linux-
> keystone.git;protocol=3Dgit;branch=3Djuly-2013b/master'.
> > >    Unable to fetch URL from any source.
> > >
> > >    ERROR: Logfile of failure stored in:
> > >    /home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-
> mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-
> linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.14929
> > >
> > >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

