Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3DB8D52978
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:22:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KMtt8019435
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297375;
	bh=AGYTgmuKuiu9TlTJ76qvjBic29gPfgeGyFcviBKvq1U=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=BVT4Z82hfYsteWr7M3Rz06NMPDZ3zt4hAi6r10wbsJ+k0A16kA9ccu1/0f15Sd/Hd
	BbrJV2heUVHamJJ27KJP//hwZnRDGMuFyfA9d9U4Omr9FDbMC+0GJnzWL32qTgiY29
	xe2bXtgRr94Pz5xnr7dWff2UfAqE/QfnvhZT0iaQ=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KMtG8005950
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:22:55 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Fri, 1 Sep 2017 15:22:54 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [matrix-gui-v2-apps][PATCH v1]
	hmi_apps : hmi_protection_relays : new demo
Thread-Index: AQHTIdSc0GxOdB/VYUuqvlxxUZgL76KgV2gggAAlCOA=
Date: Fri, 1 Sep 2017 20:22:54 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D74D9F@DLEE08.ent.ti.com>
References: <20170830211154.13489-1-manisha.agrawal@ti.com>
	<3AC2660648D2B04999D9C7562469E8AF7EC3B173@DFLE12.ent.ti.com>
In-Reply-To: <3AC2660648D2B04999D9C7562469E8AF7EC3B173@DFLE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] Re: [matrix-gui-v2-apps][PATCH v1] hmi_apps : hmi_protection_relays : new demo
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
X-List-Received-Date: Fri, 01 Sep 2017 20:23:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Patch is pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Agrawal, Manisha
> Sent: Friday, September 01, 2017 2:12 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] Re: [meta-arago] [matrix-gui-v2-apps][PATCH v1]
> hmi_apps : hmi_protection_relays : new demo
> Importance: High
>=20
> I am still waiting for feedback on this one. I need commit id from this c=
heck to
> push my other patches on another new demo.
>=20
>=20
> Regards,
> Manisha
>=20
>=20
> -----Original Message-----
> From: Agrawal, Manisha
> Sent: Wednesday, August 30, 2017 4:12 PM
> To: meta-arago@arago-project.org
> Cc: Dmytriyenko, Denys; Stiffler, Jacob; Agrawal, Manisha
> Subject: [meta-arago][matrix-gui-v2-apps][PATCH v1] hmi_apps :
> hmi_protection_relays : new demo
>=20
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../hmi_protection_relays/desc_hmi_protection_relays.html    |  9
> +++++++++
>  hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop | 12
> ++++++++++++
>  hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh     | 12
> ++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644
> hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
>  create mode 100644
> hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
>  create mode 100755
> hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh
>=20
> diff --git
> a/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
> b/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
> new file mode 100644
> index 0000000..b8e4264
> --- /dev/null
> +++ b/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
> @@ -0,0 +1,9 @@
> +<h1> Protection Relays HMI Example </h1>
> +
> +<p> This example demonstrates HMI for Protection Relays application. QT
> QWidget tool is used to draw the screen.
> +
> +<br>
> +
> +
> +</p>
> +
> diff --git a/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
> b/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
> new file mode 100644
> index 0000000..384431b
> --- /dev/null
> +++ b/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
> @@ -0,0 +1,12 @@
> +#!/usr/bin/env xdg-open
> +
> +[Desktop Entry]
> +Name=3DPROTECTION_RELAYS
> +GenericName=3DDemo App
> +Icon=3D/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
> +Exec=3D/usr/bin/runHmiProtectionRelays.sh
> +Type=3DApplication
> +ProgramType=3Dgui
> +Categories=3Dhmi
> +X-MATRIX-Lock=3Dhmi_protection_relays_lock
> +X-MATRIX-Description=3D/usr/share/matrix-gui-
> 2.0/apps/hmi_protection_relays/desc_hmi_protection_relays.html
> diff --git a/hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh
> b/hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh
> new file mode 100755
> index 0000000..3d85999
> --- /dev/null
> +++ b/hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh
> @@ -0,0 +1,12 @@
> +#!/bin/bash
> +
> +/etc/init.d/weston stop
> +sleep 1
> +echo 0 > /sys/class/graphics/fbcon/cursor_blink
> +
> +protection_relays_hmi -platform linuxfb
> +
> +echo 1 > /sys/class/graphics/fbcon/cursor_blink
> +
> +/etc/init.d/weston start
> +sleep 1
> --
> 2.13.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

