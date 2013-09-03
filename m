Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7F2D4529D0
	for <meta-arago@arago-project.org>;
	Tue,  3 Sep 2013 15:17:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83FHld8009316;
	Tue, 3 Sep 2013 10:17:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83FHltp025083;
	Tue, 3 Sep 2013 10:17:47 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 3 Sep 2013 10:17:47 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] remove-net-rules: _remove is a new
	keyword now, sanitize the function name
Thread-Index: AQHOqCRiiX7K8B5dcUiIIAqe01+ha5m0ISvQ
Date: Tue, 3 Sep 2013 15:17:47 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597011FD@DLEE11.ent.ti.com>
References: <1378157707-15689-1-git-send-email-denis@denix.org>
In-Reply-To: <1378157707-15689-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] remove-net-rules: _remove is a new keyword now, sanitize the function name
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
X-List-Received-Date: Tue, 03 Sep 2013 15:17:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, September 02, 2013 4:35 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] remove-net-rules: _remove is a new
>keyword now, sanitize the function name
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/classes/remove-net-rules.bbclass | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/meta-arago-distro/classes/remove-net-rules.bbclass
>b/meta-arago-distro/classes/remove-net-rules.bbclass
>index fcad9c7..2764f7b 100644
>--- a/meta-arago-distro/classes/remove-net-rules.bbclass
>+++ b/meta-arago-distro/classes/remove-net-rules.bbclass
>@@ -4,12 +4,11 @@
> # will allow moving SD cards between EVMs and similar boards such
>as
> # beaglebone and the EVM.
>
>-ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_remove_net_rules;"
>+ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_rm_net_rules;"
>
>-rootfs_remove_net_rules () {
>+rootfs_rm_net_rules () {
>     if [ -e ${IMAGE_ROOTFS}/lib/udev/write_net_rules ]
>     then
>         rm ${IMAGE_ROOTFS}/lib/udev/write_net_rules
>     fi
> }
>-
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

