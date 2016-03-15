Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D439352974
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 14:48:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FEm4Ak004551
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 09:48:04 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FEm4dc012453
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 09:48:04 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Tue, 15 Mar 2016 09:48:03 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/3] Add HEVC ARM decoder and its gst
	plugin for keystone
Thread-Index: AQHRe+GuTBWyeje81ESJ9PWTR0R4jp9am47g
Date: Tue, 15 Mar 2016 14:48:03 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B98CE6@DLEE08.ent.ti.com>
References: <1457733732-18531-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1457733732-18531-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Add HEVC ARM decoder and its gst plugin for keystone
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
X-List-Received-Date: Tue, 15 Mar 2016 14:48:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Friday, March 11, 2016 5:02 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [PATCH 0/3] Add HEVC ARM decoder and its gst plugin
> for keystone
>=20
> Hongmei Gou (3):
>   hevc-arm-decoder: add support for keystone platforms
>   gstreamer1.0-plugins-hevc: add support for keystone platforms
>   packagegroup-arago-gst*: add gstreamer1.0-plugins-hevc for keystone
>=20
>  .../packagegroups/packagegroup-arago-gst-sdk-target.bb           | 6 +++=
++-
>  .../recipes-core/packagegroups/packagegroup-arago-gst.bb         | 6 +++=
++-
>  .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb              | 9 +++=
+-----
>  .../hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb             | 4 ++-=
-
>  4 files changed, 16 insertions(+), 9 deletions(-)
>=20
> --
> 1.9.1


