Return-Path: <sajesh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E00CB529CA
	for <meta-arago@arago-project.org>;
	Tue, 13 Aug 2013 00:30:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7D0UXSU013370
	for <meta-arago@arago-project.org>; Mon, 12 Aug 2013 19:30:33 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7D0UX9n005324;
	Mon, 12 Aug 2013 19:30:33 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 12 Aug 2013 19:30:32 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] help needed: Top nightly failure
Thread-Index: AQHOl62q54zHd2hLV0eMEJtwKJUXa5mSSBpQ
Date: Tue, 13 Aug 2013 00:30:32 +0000
Message-ID: <8EAE6244CE843044A42356038645C8551574CEB8@DFLE12.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F4905493EC54@DLEE11.ent.ti.com>
	<20130809020846.GF25015@edge>
	<4F9216F96E5DF9428610502835A9F4905494E746@DLEE11.ent.ti.com>
	<20130812223119.GB30860@edge>
	<8F29D6B095ED194EA1980491A5E029710C51A5BC@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C51A5BC@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Tue, 13 Aug 2013 00:30:36 -0000
X-Groupsio-MsgNum: 1761
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_8EAE6244CE843044A42356038645C8551574CEB8DFLE12entticom_"

--_002_8EAE6244CE843044A42356038645C8551574CEB8DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is a reproducible issue. I guess git cloning from arago-project is a p=
roblem.
I got another e-mail (attached) that cloning of linux-davinci is also have =
similar issue.

Regards,
Sajesh

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Monday, August 12, 2013 6:46 PM
To: Dmytriyenko, Denys; Nelson, Sam
Cc: meta-arago@arago-project.org; ares-team@list.ti.com - Raj Sivarajan's T=
eam (May contain non-TIers)
Subject: [ARES] RE: [meta-arago] help needed: Top nightly failure

If this is blocking your release and your able to clone locally you could a=
lso workaround this issue by cloning it manually and then placing it in you=
r downloads directory.
Based on your log bitbake is simply running the following command so you ca=
n run this command manually:
git clone --bare --mirror git://arago-project.org/git/projects/linux-tci661=
4.git /home/a0756824/sc_mcsdk/oe-layersetup-mcsdk/downloads/git2/arago-proj=
ect.org.git.projects.linux-tci6614.git=20



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, August 12, 2013 5:31 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org; ares-team@list.ti.com - Raj=20
> Sivarajan's Team (May contain non-TIers)
> Subject: Re: [meta-arago] help needed: Top nightly failure
>=20
> Sam,
>=20
> I have already mentioned many times that you should use a mirror...
>=20
> I don't see any problems with the server and I'm cloning your trees=20
> right now w/o problems so far. You may want to check your proxy setup as =
well.
>=20
> BTW, did repacking the linux-keystone help for your nightlies? I can=20
> do the same for linux-tci6614 too...
>=20
> --
> Denys
>=20
>=20
> On Mon, Aug 12, 2013 at 06:22:11PM -0400, Nelson, Sam wrote:
> > Denys,
> > This is blocking the MCSDK 3.0.2 & SCMCSDK-2.2.0 releases and=20
> > appreciate
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
> > Cc: 'meta-arago@arago-project.org'; Sivarajan, Raj;=20
> > ares-team@list.ti.com -
> Raj Sivarajan's Team (May contain non-TIers)
> > Subject: RE: help needed: Top nightly failure
> >
> > Also  yocto builds using=20
> > git://arago-project.org/git/projects/linux-tci6614.git
> also failing for the past 3 days.
> >
> > Looks like there is no issue in cloning the repos. But only the=20
> > yocto fetch
> operation is failing.
> >
> > From the logs there is no information about what is the actual=20
> > command ,
> which failed.
> > With regards,
> > Sam
> > -----Original Message-----
> > From: Nelson, Sam
> > Sent: Monday, August 12, 2013 10:57 AM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org; Sivarajan, Raj;=20
> > ares-team@list.ti.com - Raj
> Sivarajan's Team (May contain non-TIers)
> > Subject: RE: help needed: Top nightly failure
> > Importance: High
> >
> > Hello Denys,
> > Now starting Thursday, our builds are failing now consistently.
> > Did something change in the repos?
> > WARNING: Failed to fetch URL=20
> > git://arago-project.org/git/projects/linux-
> keystone.git;protocol=3Dgit;branch=3Dcurrent/master, attempting MIRRORS i=
f=20
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
=20
> from any source.
> > ERROR: Logfile of failure stored in:=20
> > /home/a0862859/yocto/oe-layersetup-
> mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-
> linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.31058
> > ERROR: Task 684 (/home/a0862859/yocto/oe-layersetup-
> mcsdk/sources/meta-ti/recipes-kernel/linux/linux-keystone_3.8.4.bb,=20
> do_fetch) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 3212 tasks of which 3211 didn't need=20
> > to be
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
> > Please use a mirror and/or previously cloned repos from downloads/=20
> > directory
> - cloning the entire tree every night is not recommended and is rather ab=
usive.
> >
> > Also, I've repacked the linux-keystone repository so it is now=20
> > smaller - please
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

--_002_8EAE6244CE843044A42356038645C8551574CEB8DFLE12entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Tue, 13 Aug 2013 00:30:31 GMT";
	modification-date="Tue, 13 Aug 2013 00:30:31 GMT"

Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
 DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
 14.02.0342.003; Mon, 12 Aug 2013 17:46:35 -0500
From: "Wertz, Beverly" <beverly.wertz@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>
CC: "Nelson, Sam" <sam.nelson@ti.com>, "Saran, Sajesh Kumar" <sajesh@ti.com>
Subject: RE: MCSDK Build question
Thread-Topic: MCSDK Build question
Thread-Index: Ac6XmDnLGAIXLjZHTW24kuwzaSn2VQAEXzsgAACkrMA=
Date: Mon, 12 Aug 2013 22:46:35 +0000
Message-ID: <DA04BC11F659EF4E804F9788033FEB49D887AA@DFLE08.ent.ti.com>
References: <DA04BC11F659EF4E804F9788033FEB49D88776@DFLE08.ent.ti.com>
 <ECA334CFBA16F74DB2C66A2F1181F4D63C2D14B2@DLEE09.ent.ti.com>
In-Reply-To: <ECA334CFBA16F74DB2C66A2F1181F4D63C2D14B2@DLEE09.ent.ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: DLEE70.ent.ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Just to add, I=92m also seeing a failure in cloning from arago-project.org.

ERROR: Function failed: Fetcher failure for URL: 'git://arago-project.org/g=
it/projects/linux-davinci.git;protocol=3Dgit;branch=3D03.22.00.05'. Unable =
to fetch URL from any source.

This URL is failing locally too and I=92ve had intermittent issues cloning =
from arago-project.org on a lab machine which I have serving up some boards=
 for the OpenTest server.

The error I receive is identical to theirs:
beverlylocal@uda0220897a:~$ git clone git://arago-project.org/git/projects/=
linux-davinci.git
Cloning into 'linux-davinci'...
remote: Counting objects: 2797449, done.
remote: Compressing objects: 100% (442950/442950), done.
Receiving objects: 100% (2797449/2797449), 656.41 MiB | 1.50 MiB/s, done.
Resolving deltas: 100% (2327038/2327038), done.
fatal: The remote end hung up unexpectedly
fatal: error in sideband demultiplexer

-Beverly



From: Zhang, Hao
Sent: Monday, August 12, 2013 5:22 PM
To: Wertz, Beverly
Cc: Nelson, Sam; Saran, Sajesh Kumar
Subject: RE: MCSDK Build question

Looping Sam/Sajesh, who are facing similar issues during the past several d=
ays =85

Beverly,

Here are our MCSDK 3.x Jenkins build proxy settings, they look matching wit=
h your settings.

export http_proxy=3D"http://webproxy.ext.ti.com:80"
export ftp_proxy=3D"http://webproxy.ext.ti.com:80"
export https_proxy=3D"http://webproxy.ext.ti.com:80"
export no_proxy=3D"ti.com"

Sam/Sajesh,

Are these fetching errors similar to what you observed in SC/MCSDK nightly?

Thanks,
Hao.

From: Wertz, Beverly
Sent: Monday, August 12, 2013 6:16 PM
To: Zhang, Hao
Subject: MCSDK Build question

Hao,

I was advised to reach out to you in regards to MCSDK scripts and an issue =
I was having with retrieving some files on the Jenkins VM build. Things see=
m to build just fine aside from our arago build, the issues I=92m seeing ap=
pears to be fetching/firewall based. I=92ve set the proxies as follows:


+ export http_proxy=3Dhttp://webproxy.ext.ti.com:80<http://webproxy.ext.ti.=
com/>

+ export https_proxy=3Dhttp://webproxy.ext.ti.com:80

+ export ftp_proxy=3Dhttp://webproxy.ext.ti.com:80<http://webproxy.ext.ti.c=
om/>

+ export no_proxy=3D.ti.com,localhost,127.0.0.0/8,172.24.0.0/16,local



But I=92m still seeing fetch issues on the bitbake build. These files seem =
to be able to download locally and for our folks in India, is there anythin=
g wrong with my proxy setup to retrieve the files? Also, I=92m able to retr=
ieve file from other external sources so some sites get through the firewal=
l settings without any issues. If you have any insight as to how you have r=
esolved issues with your builds, we=92d be happy to hear them.



-Beverly



Example issues:



ERROR: Function failed: Fetcher failure for URL: 'http://www.cpan.org/src/5=
.0/perl-5.14.2.tar.gz'. Unable to fetch URL from any source.

ERROR: Function failed: Fetcher failure for URL: 'ftp://ftp.gnu.org/gnu/gdb=
/gdb-7.5.tar.gz'. Unable to fetch URL from any source.

ERROR: Function failed: Fetcher failure for URL: 'http://www.python.org/ftp=
/python/2.7.3/Python-2.7.3.tar.bz2'. Unable to fetch URL from any source.

ERROR: Function failed: Fetcher failure for URL: 'ftp://ftp.gnu.org/gnu/get=
text/gettext-0.18.1.1.tar.gz'. Unable to fetch URL from any source.

ERROR: Function failed: Fetcher failure for URL: 'ftp://ftp.gnu.org/gnu/bin=
utils/binutils-2.20.1a.tar.bz2'. Unable to fetch URL from any source.

ERROR: Function failed: Fetcher failure for URL: 'http://download.oracle.co=
m/berkeley-db/db-5.3.15.tar.gz'. Unable to fetch URL from any source.

ERROR: Function failed: Fetcher failure for URL: 'http://downloads.mysql.co=
m/archives/mysql-5.1/mysql-5.1.40.tar.gz'. Unable to fetch URL from any sou=
rce.




Beverly G. Wertz
DSP Software
Texas Instruments Inc.

Office:  214.479.3362


--_002_8EAE6244CE843044A42356038645C8551574CEB8DFLE12entticom_--
