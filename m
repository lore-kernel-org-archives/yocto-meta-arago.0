Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A1FBB529A4
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 15:19:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TFJ9Eu018361
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 09:19:09 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TFJ8I4020443
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 09:19:08 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 29 Jan 2015 09:19:08 -0600
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile size
Thread-Index: AQHQO9BKsdRceZrR9USU5ewb9rsprJzXNGzg
Date: Thu, 29 Jan 2015 15:19:08 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE7321FCD18@DLEE08.ent.ti.com>
References: <1422541885-5800-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1422541885-5800-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [RFC PATCH] base-files: Increase /var/volatile size
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
X-List-Received-Date: Thu, 29 Jan 2015 15:19:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Karthik,

The reason it was limited to 16MB in early days is because we had platforms=
 with only 32MB of RAM and letting tmpfs fill up uncontrollable was dangero=
us and was making the system very unstable.

One of the options is to have per-machine RAM/tmpfs setting, which can get =
propagated to /etc/fstab accordingly - e.g. 32/64 for am335x/am437 and 64/1=
28 for dra7xx, etc.

--=20
Denys


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of R, Karthik
Sent: Thursday, January 29, 2015 9:31 AM
To: meta-arago@arago-project.org
Subject: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile size

* Weston applications allocate memory from tmpfs, need to
  increase the tmpfs area to atleast 50M. Can this be
  increased more - what are the pros/cons?

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-core/base-files/base-files/fstab       |    2 +-
 .../base-files/base-files_3.0.14.bbappend          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab b/m=
eta-arago-distro/recipes-core/base-files/base-files/fstab
index 9ed6f33..8ddadd9 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
+++ b/meta-arago-distro/recipes-core/base-files/base-files/fstab
@@ -5,7 +5,7 @@ proc                 /proc                proc       defaul=
ts              0  0
 devpts               /dev/pts             devpts     mode=3D0620,gid=3D5  =
     0  0
 usbdevfs             /proc/bus/usb        usbdevfs   noauto               =
 0  0
 tmpfs                /run                 tmpfs      mode=3D0755,nodev,nos=
uid,strictatime 0  0
-tmpfs                /var/volatile        tmpfs      defaults,size=3D16M  =
   0  0
+tmpfs                /var/volatile        tmpfs      defaults,size=3D50M  =
   0  0
 tmpfs                /media/ram           tmpfs      defaults,size=3D16M  =
   0  0
=20
 # uncomment this if your device has a SD/MMC/Transflash slot diff --git a/=
meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend b/meta=
-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
index 40b7722..956a057 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappe
+++ nd
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D "-arago3"
+PR_append =3D "-arago4"
--
1.7.9.5

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

