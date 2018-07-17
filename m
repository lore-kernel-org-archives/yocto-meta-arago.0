Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C2E9052978
	for <meta-arago@arago-project.org>;
	Tue, 17 Jul 2018 13:56:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6HDuDoh100314
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 08:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531835773;
	bh=Uc0z+UXKXsEyTLUJ5nQDfBy2Ys14K39QSZqZzPTsk1E=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=h94ifMa6vuPuyV72Yhf3/6nqfq7MU2bsjcNurIZbgF9ZF28STPJl9wKXsfhKJWpcM
	WXT1KIRw3X/AGtQMmeGk+d+QTVGZoGfNxymS2XeFF+0g3cyM2P4eVRynaEyC4lmk3U
	g5B4L7uTj4W0zL9L4Uq/Y1SnhHzMA7DTjTJNZnQ0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HDuDG2021597
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 08:56:13 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 17 Jul 2018 08:56:13 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Tue, 17 Jul 2018 08:56:13 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [tisdk-setup-scripts][PATCH] setup-uboot-env-am335x: update atop
	autoboot prompt
Thread-Index: AQHUHc/3C26Om6fCKUmb9as4hHlH+aSTcCIA
Date: Tue, 17 Jul 2018 13:56:13 +0000
Message-ID: <ce771ff7f5664e179efc47d1f6409e69@ti.com>
References: <1531833211-3641-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1531833211-3641-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [tisdk-setup-scripts][PATCH] setup-uboot-env-am335x: update atop autoboot prompt
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
X-List-Received-Date: Tue, 17 Jul 2018 13:56:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK. Typo in shortlog.

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, July 17, 2018 9:14 AM
> To: meta-arago@arago-project.org
> Cc: Stiffler, Jacob
> Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-am335x: update
> atop autoboot prompt
>=20
> * The prompt to stop autoboot has changed to the default
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  setup-uboot-env-am335x.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
> index ba75b14..6950caf 100644
> --- a/setup-uboot-env-am335x.sh
> +++ b/setup-uboot-env-am335x.sh
> @@ -174,11 +174,11 @@ check_for_beaglebone() {
>  echo "timeout 300" > $cwd/setupBoard.minicom
>  echo "verbose on" >> $cwd/setupBoard.minicom
>=20
> -do_expect "\"abort autoboot\"" "send \" \"" $cwd/setupBoard.minicom
> +do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
>  do_expect "\"$prompt\"" "send \"env default -f -a\""
> $cwd/setupBoard.minicom
>  do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
>  do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
> -do_expect "\"abort autoboot\"" "send \" \"" $cwd/setupBoard.minicom
> +do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
>=20
>  if [ "$kernel" -eq "1" ]; then
>  	if [ "$fs" -eq "1" ]; then
> --
> 1.9.1


