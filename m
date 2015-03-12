Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B28BA52A29
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 14:57:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CEvlPK025380
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:57:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CEvkpb026413
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:57:46 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 09:57:46 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Hernandez, Carlos" <ceh@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recipe
Thread-Index: AQHQWzQO+VOPk3+2OEmUSaboahin5p0YSo6AgAAOXYCAAACxAIAAN0iAgACYOAD//650YIAADnHQgABbywCAAAEUgP//rElggAABl1CAAFX7gP//rKDw
Date: Thu, 12 Mar 2015 14:57:46 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814107EC9@DFLE09.ent.ti.com>
References: <1425993213-13246-1-git-send-email-ceh@ti.com>
	<20150311235329.GD23587@edge>
	<32B5D12402BE454796026F6AC58AA86E33115ACC@DLEE08.ent.ti.com>
	<20150312004722.GE23587@edge> <20150312040513.GI23587@edge>
	<5501902A.4060206@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814107D47@DFLE09.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F95814107E1F@DFLE09.ent.ti.com>
	<5501A4E0.2050107@ti.com> <20150312144215.GJ24885@edge>
	<4B26FB5A64EBA14C87266869E037F95814107E91@DFLE09.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F95814107EAA@DFLE09.ent.ti.com>
	<5501A903.7030306@ti.com>
In-Reply-To: <5501A903.7030306@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recipe
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
X-List-Received-Date: Thu, 12 Mar 2015 14:57:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I get something different:

work/am437x_evm-oe-linux-gnueabi/ltp-ddt/1.0.0-r0/git$ cat config.log | gre=
p LEXLIB
LEXLIB=3D'-lfl'


-----Original Message-----
From: Hernandez, Carlos=20
Sent: Thursday, March 12, 2015 10:56 AM
To: Stiffler, Jacob; Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recip=
e

configure does set LEXLIB to blank.

$ cat 1.0.0-r1-arago10+gitrAUTOINC+91a8baa2f8/git/config.log | grep LEXLIB =
LEXLIB=3D''


On 03/12/2015 10:50 AM, Stiffler, Jacob wrote:
> The file ./include/mk/config.mk.default makes sure that LEXLIB is undefin=
ed.
>
> The meta-oe version of the recipe for v 0.0.4 has a custom configure stag=
e to make sure that ./include/mk/config.mk.default is the config.mk used:
>
> do_configure() {
>      cp ${S}/include/config.h.default ${S}/include/config.h
>      cp ${S}/include/mk/config.mk.default ${S}/include/mk/config.mk
>      cp ${S}/include/mk/features.mk.default ${S}/include/mk/features.mk
>      echo "${TAG}" > ${S}/ChangeLog
> }
>
>
>
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org=20
> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Stiffler,=20
> Jacob
> Sent: Thursday, March 12, 2015 10:44 AM
> To: Dmytriyenko, Denys; Hernandez, Carlos
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0=20
> recipe
>
> The warning implies that LEXLIB is not defined. Therefore LEXLIB should n=
ot be linked for all targets in pan/Makefile, only ltp-scanner.
>
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, March 12, 2015 10:42 AM
> To: Hernandez, Carlos
> Cc: Stiffler, Jacob; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0=20
> recipe
>
> The successful build doesn't have -lfl after the ltp-scanner skip warning=
.
>
>
> On Thu, Mar 12, 2015 at 10:38:24AM -0400, Carlos Hernandez wrote:
>> On 03/12/2015 10:21 AM, Stiffler, Jacob wrote:
>>> The symbol 'yylex' comes from a flex generated file. Not sure how this =
isn't being seen in all builds... This will need to link with a flex genera=
ted file. In this case, all I can see is scan.c, which is generated from sc=
an.l. So should ltp_bump link with scan.o? If not, then why would ltp-bump =
need to link with libfl.so?
>>>
>>> Can you find the log for linking 'ltp-bump' in one of the successful bu=
ilds?
>> *14:59:13*  make[1]: Entering directory `/scratch/lcpdbld/jenkins_ws/wor=
kspace/start-ltp-ddt-next-build/ltp-ddt/pan'
>> *14:59:13* =20
>> /scratch/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/ltp-dd
>> t/pan/Makefile:43: ltp-scanner will not be built because a working=20
>> copy of lex was not found
>> *14:59:13* =20
>> /home/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/integrati
>> on/toolchain/linaro-4.7/bin/arm-linux-gnueabihf-gcc -g -O2 -g -O2=20
>> -fno-strict-aliasing -pipe -Wall -W -g -O2 -Wold-style-definition=20
>> -D_FORTIFY_SOURCE=3D2 -Wno-error=20
>> -I/scratch/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/ltp-
>> ddt/pan -I../include -I../include  -c -o ltp-bump.o ltp-bump.c
>> *14:59:13*  /home/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/=
integration/toolchain/linaro-4.7/bin/arm-linux-gnueabihf-gcc -g -O2 -g -O2 =
-fno-strict-aliasing -pipe -Wall -W -g -O2 -Wold-style-definition -D_FORTIF=
Y_SOURCE=3D2 -Wno-error -I/scratch/lcpdbld/jenkins_ws/workspace/start-ltp-d=
dt-next-build/ltp-ddt/pan -I../include -I../include  -c -o zoolib.o zoolib.=
c
>> *14:59:13*  /home/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/=
integration/toolchain/linaro-4.7/bin/arm-linux-gnueabihf-gcc   -L../lib  lt=
p-bump.o zoolib.o   -lm  -o ltp-bump
>> *14:59:13* =20
>> /home/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/integrati
>> on/toolchain/linaro-4.7/bin/arm-linux-gnueabihf-gcc -g -O2 -g -O2=20
>> -fno-strict-aliasing -pipe -Wall -W -g -O2 -Wold-style-definition=20
>> -D_FORTIFY_SOURCE=3D2 -Wno-error=20
>> -I/scratch/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/ltp-
>> ddt/pan -I../include -I../include  -c -o ltp-pan.o ltp-pan.c
>> *14:59:14*  /home/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/=
integration/toolchain/linaro-4.7/bin/arm-linux-gnueabihf-gcc -g -O2 -g -O2 =
-fno-strict-aliasing -pipe -Wall -W -g -O2 -Wold-style-definition -D_FORTIF=
Y_SOURCE=3D2 -Wno-error -I/scratch/lcpdbld/jenkins_ws/workspace/start-ltp-d=
dt-next-build/ltp-ddt/pan -I../include -I../include  -c -o splitstr.o split=
str.c
>> *14:59:14*  /home/lcpdbld/jenkins_ws/workspace/start-ltp-ddt-next-build/=
integration/toolchain/linaro-4.7/bin/arm-linux-gnueabihf-gcc   -L../lib  lt=
p-pan.o zoolib.o splitstr.o   -lm  -o ltp-pan
>> *14:59:14*  make[1]: Leaving directory `/scratch/lcpdbld/jenkins_ws/work=
space/start-ltp-ddt-next-build/ltp-ddt/pan'
>>
>>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


