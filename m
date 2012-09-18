Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AE5AC5209D
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2012 18:24:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8IIOOZJ020315
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2012 13:24:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8IIOOhZ028513
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2012 13:24:24 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 18 Sep 2012 13:24:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH]
	task-arago-tisdk-connectivity: Add	bluetooth stack
Thread-Index: AQHNjejQcDbqPF8MGUmo2f/IfDA4YJeAuOYFgABbqAD//7a1VYAAVqYAgAMTPoCADJZaAP//rhJw
Date: Tue, 18 Sep 2012 18:24:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2D74C9@DFLE09.ent.ti.com>
References: <1346976237-18449-1-git-send-email-fcooper27jr@gmail.com>
	<7D46E86EC0A8354091174257B2FED101591DDA07@DLEE12.ent.ti.com>
	<7F14B13F-2AE6-4F01-9612-23A1DBB11022@ti.com>
	<20120908173849.GE23896@denix.org>
	<CE36FDB5-3FE9-4108-9038-DE71F2D3BC81@ti.com>
	<7D46E86EC0A8354091174257B2FED101591DDF06@DLEE12.ent.ti.com>
	<BDA53CED-8BB7-4BB4-A4AA-6341F31B1C91@ti.com>
	<7D46E86EC0A8354091174257B2FED101591DDF84@DLEE12.ent.ti.com>
	<20120910180327.GF21288@edge> <20120918181642.GA11454@denix.org>
In-Reply-To: <20120918181642.GA11454@denix.org>
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
X-List-Received-Date: Tue, 18 Sep 2012 18:24:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Your right. Will be starting that process fairly soon.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Tuesday, September 18, 2012 1:17 PM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago-distro][PATCH] task-arago-tisdk-conne=
ctivity: Add bluetooth stack

On Mon, Sep 10, 2012 at 02:03:27PM -0400, Denys Dmytriyenko wrote:
> On Sat, Sep 08, 2012 at 03:05:48PM -0400, Maupin, Chase wrote:
> > Denys,
> >=20
> > I'll leave this to your call for what is your preferred method.
> >=20
> > This is making me think we should set Franklin up with his own git=20
> > tree so he can do pull requests.  What do you think?
>=20
> Own git tree for pull requests is always a good idea regardless of the=20
> situation... :)

I believe the agreement we reached with Franklin last week was that he will=
 resubmit the patches with the new naming convention, but will ping on the =
ones that are still good, so I don't miss anything from the queue.

Franklin, please correct me if I misunderstood. Thanks.

--
Denys



> > > -----Original Message-----
> > > From: Cooper Jr., Franklin
> > > Sent: Saturday, September 08, 2012 1:56 PM
> > > To: Maupin, Chase
> > > Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [meta-arago-distro][PATCH] task-arago-
> > > tisdk-connectivity: Add bluetooth stack
> > >=20
> > > It's the difference between sending 1 patch that renames all the
> > > recipes vs submitting 11 v2 of patches that have yet to be
> > > committed and will be affected by the new naming scheme. I prefer
> > > the one patch approach but if you both insist I can redo all the
> > > patches.
> > >=20
> > > On Sep 8, 2012, at 1:18 PM, "Maupin, Chase" <chase.maupin@ti.com>
> > > wrote:
> > >=20
> > > > I'm not sure I understand that question.  You would have to fix
> > > the naming no matter what.  If you have patches later in your
> > > patchset that use the old name, then yes you would need to fix
> > > them and resubmit them.  Then again, you would have to do the
> > > same thing either way.
> > > >
> > > > Sincerely,
> > > > Chase Maupin
> > > > Software Applications
> > > > ARM MPU
> > > > e-mail: chase.maupin@ti.com
> > > > phone: (214) 567-2950
> > > >
> > > > For support:
> > > > Forums - http://community.ti.com/forums/
> > > > Wiki - http://wiki.davincidsp.com/
> > > >
> > > >
> > > >> -----Original Message-----
> > > >> From: Cooper Jr., Franklin
> > > >> Sent: Saturday, September 08, 2012 12:50 PM
> > > >> To: Dmytriyenko, Denys
> > > >> Cc: Maupin, Chase; meta-arago@arago-project.org
> > > >> Subject: Re: [meta-arago] [meta-arago-distro][PATCH] task-
> > > arago-
> > > >> tisdk-connectivity: Add bluetooth stack
> > > >>
> > > >> Will me renaming these tasks result in me having to resubmit
> > > all
> > > >> the patches that are built on top of the these tasks?
> > > >>
> > > >> On Sep 8, 2012, at 12:38 PM, "Dmytriyenko, Denys"
> > > <denys@ti.com>
> > > >> wrote:
> > > >>
> > > >>> On Sat, Sep 08, 2012 at 04:01:42PM +0000, Cooper Jr.,
> > > Franklin
> > > >> wrote:
> > > >>>> There are quite a bit of patches that need to be renamed
> > > that
> > > >> still haven't
> > > >>>> been committed. I would prefer sending a single patch that
> > > >> renames all of
> > > >>>> the tasks once the patches are committed.
> > > >>>
> > > >>> I understand your position on this, but all the previous
> > > >> patches were
> > > >>> submitted to drop the toolchain part from the name - will you
> > > >> be able to
> > > >>> separate them afterwards?
> > > >>>
> > > >>> Denys
> > > >>>
> > > >>>
> > > >>>> On Sep 8, 2012, at 10:58 AM, "Maupin, Chase"
> > > >> <chase.maupin@ti.com> wrote:
> > > >>>>
> > > >>>>> Will you re-submit with new naming?
> > > >>>>>
> > > >>>>> Sincerely,
> > > >>>>> Chase Maupin
> > > >>>>> Software Applications
> > > >>>>> ARM MPU
> > > >>>>> e-mail: chase.maupin@ti.com
> > > >>>>> phone: (214) 567-2950
> > > >>>>>
> > > >>>>> For support:
> > > >>>>> Forums - http://community.ti.com/forums/
> > > >>>>> Wiki - http://wiki.davincidsp.com/
> > > >>>>>
> > > >>>>>
> > > >>>>>> -----Original Message-----
> > > >>>>>> From: meta-arago-bounces@arago-project.org [mailto:meta-
> > > >> arago-
> > > >>>>>> bounces@arago-project.org] On Behalf Of Franklin S. Cooper
> > > >> Jr
> > > >>>>>> Sent: Thursday, September 06, 2012 7:04 PM
> > > >>>>>> To: meta-arago@arago-project.org
> > > >>>>>> Cc: Franklin S. Cooper Jr
> > > >>>>>> Subject: [meta-arago] [meta-arago-distro][PATCH] task-
> > > arago-
> > > >>>>>> tisdk-connectivity: Add bluetooth stack
> > > >>>>>>
> > > >>>>>> * Add list of bluetooth stack libraries to task-arago-
> > > tisdk-
> > > >>>>>> connectivity.
> > > >>>>>> * This list was previously located in task-arago-tisdk-bsp
> > > >> and
> > > >>>>>> task-arago-toolchain-tisdk-bsp-target in arago.
> > > >>>>>>
> > > >>>>>> Signed-off-by: Franklin S. Cooper Jr
> > > <fcooper27jr@gmail.com>
> > > >>>>>> ---
> > > >>>>>> .../tasks/task-arago-tisdk-connectivity-target.bb  |    9
> > > >>>>>> ++++++++-
> > > >>>>>> .../tasks/task-arago-tisdk-connectivity.bb         |   16
> > > >>>>>> +++++++++++++---
> > > >>>>>> 2 files changed, 21 insertions(+), 4 deletions(-)
> > > >>>>>>
> > > >>>>>> diff --git a/meta-arago-distro/recipes-core/tasks/task-
> > > >> arago-
> > > >>>>>> tisdk-connectivity-target.bb b/meta-arago-distro/recipes-
> > > >>>>>> core/tasks/task-arago-tisdk-connectivity-target.bb
> > > >>>>>> index deb7b7b..a63c801 100644
> > > >>>>>> --- a/meta-arago-distro/recipes-core/tasks/task-arago-
> > > tisdk-
> > > >>>>>> connectivity-target.bb
> > > >>>>>> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-
> > > tisdk-
> > > >>>>>> connectivity-target.bb
> > > >>>>>> @@ -1,12 +1,19 @@
> > > >>>>>> DESCRIPTION =3D "Task to install wlan and bluetooth sources
> > > in
> > > >>>>>> SDK"
> > > >>>>>> LICENSE =3D "MIT"
> > > >>>>>> LIC_FILES_CHKSUM =3D
> > > >>>>>>
> > > >>
> > > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> > > >>>>>> 4de20420"
> > > >>>>>> -PR =3D "r0"
> > > >>>>>> +PR =3D "r1"
> > > >>>>>>
> > > >>>>>> inherit task
> > > >>>>>> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >>>>>> COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
> > > >>>>>>
> > > >>>>>> +# Bluetooth development packages
> > > >>>>>> +BLUETOOTH_STACK =3D "\
> > > >>>>>> +    bluez4-dev \
> > > >>>>>> +    openobex-dev \
> > > >>>>>> +"
> > > >>>>>> +
> > > >>>>>> RDEPENDS_${PN} =3D "\
> > > >>>>>> +    ${BLUETOOTH_STACK} \
> > > >>>>>>   wpa-supplicant-dev \
> > > >>>>>>   "
> > > >>>>>> diff --git a/meta-arago-distro/recipes-core/tasks/task-
> > > >> arago-
> > > >>>>>> tisdk-connectivity.bb b/meta-arago-distro/recipes-
> > > >>>>>> core/tasks/task-arago-tisdk-connectivity.bb
> > > >>>>>> index 1ff849c..17f97d1 100644
> > > >>>>>> --- a/meta-arago-distro/recipes-core/tasks/task-arago-
> > > tisdk-
> > > >>>>>> connectivity.bb
> > > >>>>>> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-
> > > tisdk-
> > > >>>>>> connectivity.bb
> > > >>>>>> @@ -1,7 +1,7 @@
> > > >>>>>> DESCRIPTION =3D "Task to install wlan and bluetooth packages
> > > >> into
> > > >>>>>> target FS"
> > > >>>>>> LICENSE =3D "MIT"
> > > >>>>>> LIC_FILES_CHKSUM =3D
> > > >>>>>>
> > > >>
> > > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> > > >>>>>> 4de20420"
> > > >>>>>> -PR =3D "r0"
> > > >>>>>> +PR =3D "r1"
> > > >>>>>>
> > > >>>>>> inherit task
> > > >>>>>> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >>>>>> @@ -42,10 +42,20 @@ WLAN_COMPAT =3D "ti-compat-wireless-
> > > wl12xx
> > > >> \
> > > >>>>>>              bt-enable \
> > > >>>>>> "
> > > >>>>>>
> > > >>>>>> -BLUETOOTH =3D "bluetooth-gui"
> > > >>>>>> +BLUETOOTH_STACK =3D "\
> > > >>>>>> +    bluez4 \
> > > >>>>>> +    bluez4-agent \
> > > >>>>>> +    libasound-module-bluez \
> > > >>>>>> +    bluez-hcidump \
> > > >>>>>> +    openobex \
> > > >>>>>> +    openobex-apps \
> > > >>>>>> +    obexftp \
> > > >>>>>> +    ussp-push \
> > > >>>>>> +    "
> > > >>>>>>
> > > >>>>>> RDEPENDS_${PN} =3D "\
> > > >>>>>>   ${WLAN_COMMON} \
> > > >>>>>>   ${WLAN_COMPAT} \
> > > >>>>>> -    ${BLUETOOTH} \
> > > >>>>>> +    ${BLUETOOTH_STACK} \
> > > >>>>>> +    bluetooth-gui \
> > > >>>>>> "
> > > >>>>>> --
> > > >>>>>> 1.7.0.4
> > > >>>>>>
> > > >>>>>> _______________________________________________
> > > >>>>>> meta-arago mailing list
> > > >>>>>> meta-arago@arago-project.org
> > > >>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> > > arago
> > > >>>>> _______________________________________________
> > > >>>>> meta-arago mailing list
> > > >>>>> meta-arago@arago-project.org
> > > >>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> > > arago
> > > >>>> _______________________________________________
> > > >>>> meta-arago mailing list
> > > >>>> meta-arago@arago-project.org
> > > >>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > >>>>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

