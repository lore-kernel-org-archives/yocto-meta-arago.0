Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F2727529A1
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 18:18:01 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q88II1ce010578
	for <meta-arago@arago-project.org>; Sat, 8 Sep 2012 13:18:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q88II1N5026107
	for <meta-arago@arago-project.org>; Sat, 8 Sep 2012 13:18:01 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Sat, 8 Sep 2012 13:18:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH]
	task-arago-tisdk-connectivity: Add	bluetooth stack
Thread-Index: AQHNje5HZftk0pPyr0aaF2CPmOAbwA==
Date: Sat, 8 Sep 2012 18:18:00 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591DDF06@DLEE12.ent.ti.com>
References: <1346976237-18449-1-git-send-email-fcooper27jr@gmail.com>
	<7D46E86EC0A8354091174257B2FED101591DDA07@DLEE12.ent.ti.com>
	<7F14B13F-2AE6-4F01-9612-23A1DBB11022@ti.com>,
	<20120908173849.GE23896@denix.org>
	<CE36FDB5-3FE9-4108-9038-DE71F2D3BC81@ti.com>
In-Reply-To: <CE36FDB5-3FE9-4108-9038-DE71F2D3BC81@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-distro][PATCH] task-arago-tisdk-connectivity: Add	bluetooth stack
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
X-List-Received-Date: Sat, 08 Sep 2012 18:18:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm not sure I understand that question.  You would have to fix the naming =
no matter what.  If you have patches later in your patchset that use the ol=
d name, then yes you would need to fix them and resubmit them.  Then again,=
 you would have to do the same thing either way.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Saturday, September 08, 2012 12:50 PM
> To: Dmytriyenko, Denys
> Cc: Maupin, Chase; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-arago-distro][PATCH] task-arago-
> tisdk-connectivity: Add bluetooth stack
>=20
> Will me renaming these tasks result in me having to resubmit all
> the patches that are built on top of the these tasks?
>=20
> On Sep 8, 2012, at 12:38 PM, "Dmytriyenko, Denys" <denys@ti.com>
> wrote:
>=20
> > On Sat, Sep 08, 2012 at 04:01:42PM +0000, Cooper Jr., Franklin
> wrote:
> >> There are quite a bit of patches that need to be renamed that
> still haven't
> >> been committed. I would prefer sending a single patch that
> renames all of
> >> the tasks once the patches are committed.
> >
> > I understand your position on this, but all the previous
> patches were
> > submitted to drop the toolchain part from the name - will you
> be able to
> > separate them afterwards?
> >
> > Denys
> >
> >
> >> On Sep 8, 2012, at 10:58 AM, "Maupin, Chase"
> <chase.maupin@ti.com> wrote:
> >>
> >>> Will you re-submit with new naming?
> >>>
> >>> Sincerely,
> >>> Chase Maupin
> >>> Software Applications
> >>> ARM MPU
> >>> e-mail: chase.maupin@ti.com
> >>> phone: (214) 567-2950
> >>>
> >>> For support:
> >>> Forums - http://community.ti.com/forums/
> >>> Wiki - http://wiki.davincidsp.com/
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: meta-arago-bounces@arago-project.org [mailto:meta-
> arago-
> >>>> bounces@arago-project.org] On Behalf Of Franklin S. Cooper
> Jr
> >>>> Sent: Thursday, September 06, 2012 7:04 PM
> >>>> To: meta-arago@arago-project.org
> >>>> Cc: Franklin S. Cooper Jr
> >>>> Subject: [meta-arago] [meta-arago-distro][PATCH] task-arago-
> >>>> tisdk-connectivity: Add bluetooth stack
> >>>>
> >>>> * Add list of bluetooth stack libraries to task-arago-tisdk-
> >>>> connectivity.
> >>>> * This list was previously located in task-arago-tisdk-bsp
> and
> >>>> task-arago-toolchain-tisdk-bsp-target in arago.
> >>>>
> >>>> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> >>>> ---
> >>>> .../tasks/task-arago-tisdk-connectivity-target.bb  |    9
> >>>> ++++++++-
> >>>> .../tasks/task-arago-tisdk-connectivity.bb         |   16
> >>>> +++++++++++++---
> >>>> 2 files changed, 21 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/meta-arago-distro/recipes-core/tasks/task-
> arago-
> >>>> tisdk-connectivity-target.bb b/meta-arago-distro/recipes-
> >>>> core/tasks/task-arago-tisdk-connectivity-target.bb
> >>>> index deb7b7b..a63c801 100644
> >>>> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> >>>> connectivity-target.bb
> >>>> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> >>>> connectivity-target.bb
> >>>> @@ -1,12 +1,19 @@
> >>>> DESCRIPTION =3D "Task to install wlan and bluetooth sources in
> >>>> SDK"
> >>>> LICENSE =3D "MIT"
> >>>> LIC_FILES_CHKSUM =3D
> >>>>
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> >>>> 4de20420"
> >>>> -PR =3D "r0"
> >>>> +PR =3D "r1"
> >>>>
> >>>> inherit task
> >>>> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>> COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
> >>>>
> >>>> +# Bluetooth development packages
> >>>> +BLUETOOTH_STACK =3D "\
> >>>> +    bluez4-dev \
> >>>> +    openobex-dev \
> >>>> +"
> >>>> +
> >>>> RDEPENDS_${PN} =3D "\
> >>>> +    ${BLUETOOTH_STACK} \
> >>>>    wpa-supplicant-dev \
> >>>>    "
> >>>> diff --git a/meta-arago-distro/recipes-core/tasks/task-
> arago-
> >>>> tisdk-connectivity.bb b/meta-arago-distro/recipes-
> >>>> core/tasks/task-arago-tisdk-connectivity.bb
> >>>> index 1ff849c..17f97d1 100644
> >>>> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> >>>> connectivity.bb
> >>>> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> >>>> connectivity.bb
> >>>> @@ -1,7 +1,7 @@
> >>>> DESCRIPTION =3D "Task to install wlan and bluetooth packages
> into
> >>>> target FS"
> >>>> LICENSE =3D "MIT"
> >>>> LIC_FILES_CHKSUM =3D
> >>>>
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> >>>> 4de20420"
> >>>> -PR =3D "r0"
> >>>> +PR =3D "r1"
> >>>>
> >>>> inherit task
> >>>> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>> @@ -42,10 +42,20 @@ WLAN_COMPAT =3D "ti-compat-wireless-wl12xx
> \
> >>>>               bt-enable \
> >>>> "
> >>>>
> >>>> -BLUETOOTH =3D "bluetooth-gui"
> >>>> +BLUETOOTH_STACK =3D "\
> >>>> +    bluez4 \
> >>>> +    bluez4-agent \
> >>>> +    libasound-module-bluez \
> >>>> +    bluez-hcidump \
> >>>> +    openobex \
> >>>> +    openobex-apps \
> >>>> +    obexftp \
> >>>> +    ussp-push \
> >>>> +    "
> >>>>
> >>>> RDEPENDS_${PN} =3D "\
> >>>>    ${WLAN_COMMON} \
> >>>>    ${WLAN_COMPAT} \
> >>>> -    ${BLUETOOTH} \
> >>>> +    ${BLUETOOTH_STACK} \
> >>>> +    bluetooth-gui \
> >>>> "
> >>>> --
> >>>> 1.7.0.4
> >>>>
> >>>> _______________________________________________
> >>>> meta-arago mailing list
> >>>> meta-arago@arago-project.org
> >>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>> _______________________________________________
> >>> meta-arago mailing list
> >>> meta-arago@arago-project.org
> >>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>

