Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0F8C0032E
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 14:50:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.100251.1697986235284726141
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 22 Oct 2023 07:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jy5wlc1J;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: s-adivi@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39MEoTPB056668;
	Sun, 22 Oct 2023 09:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697986229;
	bh=f9H/8Y7eckQ7kShMye9gMK+k/sp/zKuUaIlR6Q3spZU=;
	h=From:To:CC:Subject:Date;
	b=jy5wlc1JmziUwZdcru0ktmqhXT0P5+sSrrFlvG7KufeeBlwtFlG71bQO0RaXLS5sj
	 uLJ2xUsWuSLZhsMQWuy7BK7wsxyKXST8jQekg9fCsm8lgIuSusqXaTC6fJirJaKpYL
	 3PZiZ6qA4SLK1AtRSBftGW3aKL0LGZCNIz1+/UhY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39MEoTwg115972
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Oct 2023 09:50:29 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 22
 Oct 2023 09:50:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 22 Oct 2023 09:50:29 -0500
Received: from SHIELD01.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39MEoQms021604;
	Sun, 22 Oct 2023 09:50:26 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <c-shilwant@ti.com>, <a-limaye@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [meta-arago][kirkstone][PATCH] tisdk-sw-manifest: Add TI-TFL LICENSE to manifest file footer
Date: Sun, 22 Oct 2023 20:20:22 +0530
Message-ID: <20231022145022.4045365-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 39MEoTPB056668
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 22 Oct 2023 14:50:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14965

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../classes/tisdk-sw-manifest.bbclass         | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass b/meta-a=
rago-distro/classes/tisdk-sw-manifest.bbclass
index c62e3557..14d14f08 100644
--- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
+++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
@@ -188,6 +188,42 @@ echo "
 <p>The availability of this Exception does not imply any general presump=
tion that third-party software is unaffected by the copyleft requirements=
 of the license of GCC.</p>
=20
 <hr>
+
+<h2>TEXAS INSTRUMENTS TEXT FILE LICENSE</h2>
+
+
+<h3>Copyright (c) 2022 - 2023 Texas Instruments Incorporated</h3>
+
+<p>All rights reserved not granted herein.</p>
+
+<h3>Limited License.</h3>
+
+<p>Texas Instruments Incorporated grants a world-wide, royalty-free, non=
-exclusive license under copyrights and patents it now or hereafter owns =
or controls to make, have made, use, import, offer to sell and sell ("Uti=
lize") this software subject to the terms herein.  With respect to the fo=
regoing patent license, such license is granted  solely to the extent tha=
t any such patent is necessary to Utilize the software alone.  The patent=
 license shall not apply to any combinations which include this software,=
 other than combinations with devices manufactured by or for TI (=E2=80=9C=
TI Devices=E2=80=9D).  No hardware patent is licensed hereunder.</p>
+
+<p>Redistributions must preserve existing copyright notices and reproduc=
e this license (including the above copyright notice and the disclaimer a=
nd (if applicable) source code license limitations below) in the document=
ation and/or other materials provided with the distribution</p>
+
+<p>Redistribution and use in binary form, without modification, are perm=
itted provided that the following conditions are met:</p>
+
+<p>*	No reverse engineering, decompilation, or disassembly of this softw=
are is permitted with respect to any software provided in binary form.</p=
>
+
+<p>*	any redistribution and use are licensed by TI for use only with TI =
Devices.</p>
+
+<p>*	Nothing shall obligate TI to provide you with source code for the s=
oftware licensed and provided to you in object code.</p>
+
+<p>If software source code is provided to you, modification and redistri=
bution of the source code are permitted provided that the following condi=
tions are met:</p>
+
+<p>*	any redistribution and use of the source code, including any result=
ing derivative works, are licensed by TI for use only with TI Devices.</p=
>
+
+<p>*	any redistribution and use of any object code compiled from the sou=
rce code and any resulting derivative works, are licensed by TI for use o=
nly with TI Devices.</p>
+
+<p>Neither the name of Texas Instruments Incorporated nor the names of i=
ts suppliers may be used to endorse or promote products derived from this=
 software without specific prior written permission.</p>
+
+<h3>DISCLAIMER.</h3>
+
+<p>THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" AN=
D ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE I=
MPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE=
 ARE DISCLAIMED. IN NO EVENT SHALL TI AND TI=E2=80=99S LICENSORS BE LIABL=
E FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENT=
IAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOO=
DS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) =
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRIC=
T LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY W=
AY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF=
 SUCH DAMAGE.</p>
+
+<hr>
+
 <right> <i><font color=3Dgrey>Auto generated by TISDK installer on `date=
`</i> </right></font>
 </body>
 </html>
@@ -234,6 +270,39 @@ You have permission to propagate a work of Target Co=
de formed by combining the R
=20
 The availability of this Exception does not imply any general presumptio=
n that third-party software is unaffected by the copyleft requirements of=
 the license of GCC.
=20
+TEXAS INSTRUMENTS TEXT FILE LICENSE
+
+
+Copyright (c) 2022 =E2=80=93 2023 Texas Instruments Incorporated
+
+All rights reserved not granted herein.
+
+Limited License.
+
+Texas Instruments Incorporated grants a world-wide, royalty-free, non-ex=
clusive license under copyrights and patents it now or hereafter owns or =
controls to make, have made, use, import, offer to sell and sell ("Utiliz=
e") this software subject to the terms herein.  With respect to the foreg=
oing patent license, such license is granted  solely to the extent that a=
ny such patent is necessary to Utilize the software alone.  The patent li=
cense shall not apply to any combinations which include this software, ot=
her than combinations with devices manufactured by or for TI (=E2=80=9CTI=
 Devices=E2=80=9D).  No hardware patent is licensed hereunder.
+
+Redistributions must preserve existing copyright notices and reproduce t=
his license (including the above copyright notice and the disclaimer and =
(if applicable) source code license limitations below) in the documentati=
on and/or other materials provided with the distribution
+
+Redistribution and use in binary form, without modification, are permitt=
ed provided that the following conditions are met:
+
+*	No reverse engineering, decompilation, or disassembly of this software=
 is permitted with respect to any software provided in binary form.
+
+*	any redistribution and use are licensed by TI for use only with TI Dev=
ices.
+
+*	Nothing shall obligate TI to provide you with source code for the soft=
ware licensed and provided to you in object code.
+
+If software source code is provided to you, modification and redistribut=
ion of the source code are permitted provided that the following conditio=
ns are met:
+
+*	any redistribution and use of the source code, including any resulting=
 derivative works, are licensed by TI for use only with TI Devices.
+
+*	any redistribution and use of any object code compiled from the source=
 code and any resulting derivative works, are licensed by TI for use only=
 with TI Devices.
+
+Neither the name of Texas Instruments Incorporated nor the names of its =
suppliers may be used to endorse or promote products derived from this so=
ftware without specific prior written permission.
+
+DISCLAIMER.
+
+THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" AND A=
NY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPL=
IED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE AR=
E DISCLAIMED. IN NO EVENT SHALL TI AND TI=E2=80=99S LICENSORS BE LIABLE F=
OR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL=
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS =
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOW=
EVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT L=
IABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY =
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SU=
CH DAMAGE.
+
 </licenses>
 EOF
=20
--=20
2.34.1


