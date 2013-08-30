Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9E9DC52A81
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2013 15:05:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7UF53AP023178
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:05:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7UF52Ll024758
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:05:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 30 Aug 2013 10:05:02 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/6 v2] sourceipk: Add ability to preserve
	Git	repository
Thread-Index: AQHOo1o/wNMWkc9rtEm9cpmm26ZA+5mt3dCw
Date: Fri, 30 Aug 2013 15:05:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596F8144@DLEE11.ent.ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
	<1377633092-29917-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1377633092-29917-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/6 v2] sourceipk: Add ability to preserve Git	repository
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
X-List-Received-Date: Fri, 30 Aug 2013 15:05:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, August 27, 2013 2:51 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 2/6 v2] sourceipk: Add ability to
>preserve Git repository
>
>* When a git repository is unpacked the repository located in the
>WORKDIR is
>  cloned from the git repository located in the downloads
>directory.
>* Various references and settings are set within the repo which
>makes it
>  impossible for the git repository packaged by sourceipk to be
>useable on any
>  computer other than the original computer that the sourceipk was
>created in.
>* This patch allows the git repository to be preserved and fixed
>up to become
>  a fully functional portable git repository.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
>Version 2 changes:
>Fix commit message typo and add comment removal to this patch.
>
> meta-arago-distro/classes/sourceipk.bbclass |   35
>+++++++++++++++++++++++----
> 1 files changed, 30 insertions(+), 5 deletions(-)
>
>diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-
>arago-distro/classes/sourceipk.bbclass
>index 1844ff3..1ea0577 100644
>--- a/meta-arago-distro/classes/sourceipk.bbclass
>+++ b/meta-arago-distro/classes/sourceipk.bbclass
>@@ -59,17 +59,42 @@ SRCIPK_SECTION ?=3D "${SECTION}"
> # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
> SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
>
>-# Remove git repositories before packaging up the sources
>-clear_git() {
>+SRCIPK_PRESERVE_GIT ?=3D "false"
>+
>+adjust_git() {
>+
>+    orig_dir=3D"$PWD"
>
>     cd ${S}
>
>     if [ -d ".git" ]
>     then
>-        rm -rf .git
>+
>+        # Grab path to cloned local repository
>+        old=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   |
>cut -c 7- | tr -d ' '`
>+
>+        if [ -d $old -a "${SRCIPK_PRESERVE_GIT}" =3D "true" ]
>+        then
>+            cd $old
>+
>+            # Grab actual url used to create the repository
>+            orig=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f
>1   | cut -c 7- | tr -d ' '`
>+
>+            cd -
>+
>+            git remote set-url origin $orig $old
>+
>+            # Repackage the repository so its a proper clone of
>the original (remote) git repository
>+            git repack -a -d
>+            rm .git/objects/info/alternates
>+
>+        else
>+            rm -rf .git
>+        fi
>+
>     fi
>
>-    cd -
>+    cd $orig_dir
>
> }
>
>@@ -97,7 +122,7 @@ sourceipk_do_create_srcipk() {
>     if [ ${CREATE_SRCIPK} !=3D "0" ]
>     then
>
>-        clear_git
>+        adjust_git
>
>         tmp_dir=3D"${WORKDIR}/sourceipk-tmp"
>         srcipk_dir=3D"${WORKDIR}/sourceipk-data"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

