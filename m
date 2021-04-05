Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 984D952BB4
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 20:26:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135KR0J9001549;
	Mon, 5 Apr 2021 15:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617654420;
	bh=u6boOzpWOcNvcpmCk8a5a0lr4+oLgfoS2QlU/8xVGEo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Le6sNScMRb2oDUXVjD3bNOB5Y+LAm7b5OHyE6hI5Rl0dBeI33DCmxt4IVqTNHjk2l
	QGBx7JpYt96eim+65tKicNddRPJu4UFmhxmGm5rcI8LHVTwEB0XkEnT6uOwRlMB8ww
	wJUtlOo3e/l31CoX5tbEV2RFQtRrdBYc7trUT8CI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135KR0Ba008960
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 15:27:00 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 5 Apr 2021 15:27:00 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Mon, 5 Apr 2021 15:27:00 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [master][PATCH 16/29] kmscube: pin down version
	before GL3+ features were merged
Thread-Index: AQHXKB3YT+WkfxUitk66m4BhquIEtaqmY3bg
Date: Mon, 5 Apr 2021 20:27:00 +0000
Message-ID: <2c82657f3fc54632839e879d7a28ea07@ti.com>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
	<1617408644-2675-17-git-send-email-denis@denix.org>
In-Reply-To: <1617408644-2675-17-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [master][PATCH 16/29] kmscube: pin down version before GL3+ features were merged
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
X-List-Received-Date: Mon, 05 Apr 2021 20:26:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Denys Dmytriyenko <denis@denix.org>
>Sent: Friday, April 02, 2021 7:11 PM
>To: meta-arago@arago-project.org
>Cc: Denys Dmytriyenko <denys@konsulko.com>; Tammana, Gowtham <g-
>tammana@ti.com>
>Subject: [EXTERNAL] [master][PATCH 16/29] kmscube: pin down version before
>GL3+ features were merged
>
>From: Denys Dmytriyenko <denys@konsulko.com>
>
>More and more GL3+ features are being added to kmscube w/o easy way to
>disable
>them. Pin down older version from dunfell, until GL3+ code can be patched
>out.
>
>Also, suppress gcc10 multiple definition of 'gl' error for now.
>
>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>Cc: Gowtham Tammana <g-tammana@ti.com>

Will take a look to see if these can be configured through appropriate flag=
s.

For this patch.
Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>---
> meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
>b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
>index d11012a..2d43a6b 100644
>--- a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
>+++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
>@@ -1,7 +1,11 @@
> FILESEXTRAPATHS_append :=3D "${THISDIR}/${PN}:"
>
>+SRCREV =3D "76bb57d539cb43d267e561024c34e031bf351e04"
>+
> SRC_URI +=3D " \
> file://0001-meson-check-for-gles3-support.patch \
> "
>
>-PR_append =3D ".arago1"
>+CFLAGS +=3D "-fcommon"
>+
>+PR_append =3D ".arago2"
>--
>2.7.4


