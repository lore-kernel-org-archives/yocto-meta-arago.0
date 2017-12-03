Return-Path: <eyalr@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 05C9852A42
	for <meta-arago@arago-project.org>;
	Sun,  3 Dec 2017 10:38:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB3Ac6te000674
	for <meta-arago@arago-project.org>; Sun, 3 Dec 2017 04:38:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512297486;
	bh=I7m5RxKm972yOWzgHdfUVF/mrAzvlTlH9NrUdImyRUA=;
	h=From:To:CC:Subject:Date;
	b=HYDtgELmBla2zbbZ9v07/MMsPHfB/41OA8QmlfQL+fdJ9GlorUC+iltGgfQPalDgm
	gey0aTt0UKhrmm6Wv/dJ/1wvr6TD9g/M6KbCU4YFoTKgsalDS2+RDcs66Z5oc2v4Os
	6Gq+KJnK2yxuIOuo0WNxusHV9lsFgkn0/lxRytyU=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB3Ac5Up012052
	for <meta-arago@arago-project.org>; Sun, 3 Dec 2017 04:38:06 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Sun, 3 Dec 2017 11:38:05 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 0/2] wl18xx: add recipes for building R8.7_SP3
Thread-Index: AdNsIsiEuZtQQr8bQw21tdPCkzAHrw==
Date: Sun, 3 Dec 2017 10:38:04 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364A85A7@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.94]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH 0/2] wl18xx: add recipes for building R8.7_SP3
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
X-List-Received-Date: Sun, 03 Dec 2017 10:38:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

R8.7_SP3 contains WPA2 vulnurability fixes.

Fixes: LCPD-11124

Eyal Reizer (2):
  wpa-supplicant-wl18xx: update recipe for version R8.7_SP3
  hostap-daemon-wl18xx: update recipe for version R8.7_SP3

 .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb  | 12 ++++++------
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb              | 16 ++++++++----=
----
 2 files changed, 14 insertions(+), 14 deletions(-)

--=20
2.7.4


