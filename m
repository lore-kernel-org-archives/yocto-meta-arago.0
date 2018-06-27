Return-Path: <x0038811@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A976E529CE
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 14:02:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RE2lYS057281
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 09:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530108167;
	bh=T5ZOXpSjN1K3WTneQgoNrqniOu6klvSyrJjp7KwRkRc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=sjPxBGIVA2c7TLrH/sPxYJRStB0MEQXhcpu1FBmwQL1LtWGTaMcH//RgxOyrWRtO5
	mGKnh6/zzf8DkUs1voq5rHA/nCGjutwvB96drdK8K0qt3DJm2tHrbjGN/rT4+p4cxA
	ajFdqg7KMM4V5j7G/8m6oX2gqJRWi75Oewgc4Zo0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RE2lFK011104
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 09:02:47 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 09:02:47 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1466.003; Wed, 27 Jun 2018 09:02:47 -0500
From: "Prasad, Ram" <x0038811@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko 0/1] gstwaylandsink
Thread-Index: AQHUChwXHqi+82uIMEazpX9kxVHqe6RzQCiAgAC+utA=
Date: Wed, 27 Jun 2018 14:02:47 +0000
Message-ID: <b615320b2e644321b8dc44df61a182b1@ti.com>
References: <1529666884-6396-1-git-send-email-x0038811@ti.com>
	<20180626190251.GK3163@beryl>
In-Reply-To: <20180626190251.GK3163@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.91.86.186]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko 0/1] gstwaylandsink
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
X-List-Received-Date: Wed, 27 Jun 2018 14:02:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
Upstreaming gstreamer patches is still pending. We are estimating the effor=
t required.

Thanks
Ramprasad

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, June 27, 2018 12:33 AM
To: Prasad, Ram
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [rocko 0/1] gstwaylandsink

On Fri, Jun 22, 2018 at 04:58:03PM +0530, Ramprasad N wrote:
> Add input device like mouse, touch etc to waylandsink.
>=20
> Ramprasad N (1):
>   gstreamer1.0*-bad: Input device support in waylandsink
>=20
>  ...ylandsink-Add-mouse-drag-and-drop-support.patch | 426 +++++++++
>  ...0005-waylandsink-Add-input-device-support.patch | 990 +++++++++++++++=
++++++
>  .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   5 +-
>  3 files changed, 1420 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch

What is the upstream status of these patches?

--=20
Denys

