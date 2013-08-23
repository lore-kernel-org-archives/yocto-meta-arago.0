Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 18B8152A5F
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:30:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NKUdP1003051;
	Fri, 23 Aug 2013 15:30:39 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKUdqn027369;
	Fri, 23 Aug 2013 15:30:39 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:30:39 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/4] linux-ti-staging: enable LOCALVERSION
	and	AUTOREV
Thread-Index: AQHOoD28zq1orsYEmEylgpTcK8H0UpmjPNwggABUmAD//6z50A==
Date: Fri, 23 Aug 2013 20:30:38 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DF417@DLEE11.ent.ti.com>
References: <1377289002-20230-1-git-send-email-denis@denix.org>
	<1377289002-20230-3-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101596DF291@DLEE11.ent.ti.com>
	<20130823202634.GD27308@edge>
In-Reply-To: <20130823202634.GD27308@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/4] linux-ti-staging: enable LOCALVERSION and	AUTOREV
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
X-List-Received-Date: Fri, 23 Aug 2013 20:30:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Friday, August 23, 2013 3:27 PM
>To: Maupin, Chase
>Cc: Denys Dmytriyenko; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 3/4] linux-ti-staging: enable
>LOCALVERSION and AUTOREV
>
>On Fri, Aug 23, 2013 at 08:24:19PM +0000, Maupin, Chase wrote:
>> >-----Original Message-----
>> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>> >Sent: Friday, August 23, 2013 3:17 PM
>> >To: meta-arago@arago-project.org
>> >Subject: [meta-arago] [PATCH 3/4] linux-ti-staging: enable
>> >LOCALVERSION and AUTOREV
>> >
>> >From: Denys Dmytriyenko <denys@ti.com>
>> >
>> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >---
>> > .../linux/linux-ti-staging_git.bbappend               | 19
>> >+++++++++++++++++++
>> > 1 file changed, 19 insertions(+)
>> > create mode 100644 meta-arago-distro/recipes-
>kernel/linux/linux-
>> >ti-staging_git.bbappend
>> >
>> >diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>> >staging_git.bbappend b/meta-arago-distro/recipes-
>> >kernel/linux/linux-ti-staging_git.bbappend
>> >new file mode 100644
>> >index 0000000..a0a777c
>> >--- /dev/null
>> >+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
>> >staging_git.bbappend
>> >@@ -0,0 +1,19 @@
>> >+MACHINE_KERNEL_PR_append =3D "-arago0"
>> >+
>> >+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>> >+
>> >+require copy-defconfig.inc
>> >+
>> >+SRCREV =3D "${AUTOREV}"
>> >+
>> >+KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
>> >True).partition('+')[2][0:7]}"
>> >+
>> >+# The below lines are overlayed until the LOCALVERSION change
>is
>> >merged into
>> >+# the oe-core danny branch. Update: not coming to danny, keep
>> >until dylan.
>>
>> Dylan is here.  Still needed?
>
>Right, update: still not in dylan, RP didn't like it...

I remember that note now.  But it was about for 1.4 release. Is he willing =
to take that update for the next release after dylan?  Or was there somethi=
ng else he was concerned about?

>
>
>> >+kernel_do_configure_prepend() {
>> >+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
>> >+    then
>> >+        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>> >+        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>> >+    fi
>> >+}
>> >--
>> >1.8.3.2
>> >
>> >_______________________________________________
>> >meta-arago mailing list
>> >meta-arago@arago-project.org
>> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

