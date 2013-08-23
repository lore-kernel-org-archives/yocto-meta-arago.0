Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 48DB752A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 14:25:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NEPqca017444
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 09:25:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NEPqiE005248
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 09:25:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 09:25:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/4] sourceipk: Add ability to preserve
	Git	repository
Thread-Index: AQHOn3/9g/KhO4QNFEC52j71pUwLFZmi2jmQ
Date: Fri, 23 Aug 2013 14:25:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DCCC2@DLEE11.ent.ti.com>
References: <1377209433-10830-1-git-send-email-fcooper@ti.com>
	<1377209433-10830-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1377209433-10830-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] sourceipk: Add ability to preserve Git	repository
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
X-List-Received-Date: Fri, 23 Aug 2013 14:25:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, August 22, 2013 5:11 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 2/4] sourceipk: Add ability to
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
>* This patche allows the git repository to be preserved and fixed
>up to become
>  a fully functional portable git repository.

Small typo "patche -> patch"

>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> meta-arago-distro/classes/sourceipk.bbclass |   34
>+++++++++++++++++++++++---
> 1 files changed, 30 insertions(+), 4 deletions(-)
>
>diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-
>arago-distro/classes/sourceipk.bbclass
>index 1844ff3..0f0c633 100644
>--- a/meta-arago-distro/classes/sourceipk.bbclass
>+++ b/meta-arago-distro/classes/sourceipk.bbclass
>@@ -59,17 +59,43 @@ SRCIPK_SECTION ?=3D "${SECTION}"
> # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
> SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
>
>+SRCIPK_PRESERVE_GIT ?=3D "false"
>+
> # Remove git repositories before packaging up the sources
>-clear_git() {
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
>@@ -97,7 +123,7 @@ sourceipk_do_create_srcipk() {
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

