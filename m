Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4EA7B529CA
	for <meta-arago@arago-project.org>;
	Mon, 12 Aug 2013 22:22:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7CMMC43011214
	for <meta-arago@arago-project.org>; Mon, 12 Aug 2013 17:22:12 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7CMMC5M007298;
	Mon, 12 Aug 2013 17:22:12 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 12 Aug 2013 17:22:11 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: help needed: Top nightly failure
Thread-Index: Ac6PaQWKy78HI/DYT4asbnLR1JblhgFZkRkAAKcjMsAAAxtF4AAMfynA
Importance: high
X-Priority: 1
Date: Mon, 12 Aug 2013 22:22:11 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905494E746@DLEE11.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F4905493EC54@DLEE11.ent.ti.com>
	<20130809020846.GF25015@edge>  
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"ares-team@list.ti.com - Raj
	Sivarajan's Team \(May contain non-TIers\)" <ares-team@list.ti.com>
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
X-List-Received-Date: Mon, 12 Aug 2013 22:22:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,
This is blocking the MCSDK 3.0.2 & SCMCSDK-2.2.0 releases and appreciate an=
y help in resolving this issue.

With regards,
Sam

-----Original Message-----
From: Nelson, Sam=20
Sent: Monday, August 12, 2013 12:27 PM
To: Dmytriyenko, Denys
Cc: 'meta-arago@arago-project.org'; Sivarajan, Raj; ares-team@list.ti.com -=
 Raj Sivarajan's Team (May contain non-TIers)
Subject: RE: help needed: Top nightly failure

Also  yocto builds using git://arago-project.org/git/projects/linux-tci6614=
.git also failing for the past 3 days.

Looks like there is no issue in cloning the repos. But only the yocto fetch=
 operation is failing.

From the logs there is no information about what is the actual command , wh=
ich failed.
With regards,
Sam
-----Original Message-----
From: Nelson, Sam=20
Sent: Monday, August 12, 2013 10:57 AM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org; Sivarajan, Raj; ares-team@list.ti.com - R=
aj Sivarajan's Team (May contain non-TIers)
Subject: RE: help needed: Top nightly failure
Importance: High

Hello Denys,
Now starting Thursday, our builds are failing now consistently.
Did something change in the repos?=20
WARNING: Failed to fetch URL git://arago-project.org/git/projects/linux-key=
stone.git;protocol=3Dgit;branch=3Dcurrent/master, attempting MIRRORS if ava=
ilable
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository '/home/a0862859/yocto/oe-layersetup-mcsdk/down=
loads/git2/arago-project.org.git.projects.linux-keystone.git'...

fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

ERROR: Function failed: Fetcher failure for URL: 'git://arago-project.org/g=
it/projects/linux-keystone.git;protocol=3Dgit;branch=3Dcurrent/master'. Una=
ble to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/a0862859/yocto/oe-layersetup-mcs=
dk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-linux-gnu=
eabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.31058
ERROR: Task 684 (/home/a0862859/yocto/oe-layersetup-mcsdk/sources/meta-ti/r=
ecipes-kernel/linux/linux-keystone_3.8.4.bb, do_fetch) failed with exit cod=
e '1'
NOTE: Tasks Summary: Attempted 3212 tasks of which 3211 didn't need to be r=
erun and 1 failed.
No currently running tasks (351 of 3340)

With regards,
Sam

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, August 08, 2013 10:09 PM
To: Nelson, Sam
Cc: meta-arago@arago-project.org; Sivarajan, Raj
Subject: Re: help needed: Top nightly failure

Sam,

Please use a mirror and/or previously cloned repos from downloads/ director=
y - cloning the entire tree every night is not recommended and is rather ab=
usive.

Also, I've repacked the linux-keystone repository so it is now smaller - pl=
ease let me know if you still see the problem.

--
Denys


On Fri, Aug 02, 2013 at 06:20:08AM -0400, Nelson, Sam wrote:
>    Hello All
>=20
>    =20
>=20
>    We are encountering a lot of nightly failures with fetch failure like =
the
>    following from the arago-project git.  The error happens randomly and
>    unpredictably.
>=20
>    Is this something to do with git servers going down/offline?
>=20
>    Any ideas in tracking this type of issue will be appreciated.
>=20
>    =20
>=20
>    With regards,
>=20
>    Sam
>=20
>    =20
>=20
>    ERROR: Fetcher failure: Fetch command failed with exit code 128, outpu=
t:
>=20
>    Cloning into bare repository
>    '/home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-mcsdk/downloads/g=
it2/arago-project.org.git.projects.linux-keystone.git'...
>=20
>    =20
>=20
>    fatal: The remote end hung up unexpectedly
>=20
>    fatal: early EOF
>=20
>    fatal: index-pack failed
>=20
>    =20
>=20
>    ERROR: Function failed: Fetcher failure for URL:
>    'git://arago-project.org/git/projects/linux-keystone.git;protocol=3Dgi=
t;branch=3Djuly-2013b/master'.
>    Unable to fetch URL from any source.
>=20
>    ERROR: Logfile of failure stored in:
>    /home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-mcsdk/build/arago-=
tmp-external-linaro-toolchain/work/keystone_evm-oe-linux-gnueabi/linux-keys=
tone-3.8.4-r6a/temp/log.do_fetch.14929
>=20
>    =20

