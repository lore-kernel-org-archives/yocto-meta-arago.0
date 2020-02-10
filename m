Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 22807529B5
	for <meta-arago@arago-project.org>;
	Mon, 10 Feb 2020 13:15:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01ADDJeK028201
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 07:13:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581340399;
	bh=ZXKHCRG6Ox88ObfwV5a0LO4ur/t+/juk0VIy1glsBMk=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=bp+qMApPgvJaGjOHcOvRQRUbOaWaNlHzdOzQN7EuJX9BC81C/FwRk4ozICKs7EyUm
	LqHPonDYRmlqM8UOrHihZEU76k6tHuKF7+dawA6T1NDKJgwR4JhEqTKaeMz22OP/CL
	U+8VJ6q4fuIUF+1K4pchsgpBXsu3coV2q3Jr8SAA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01ADDJp8011784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 07:13:19 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 10 Feb 2020 07:13:19 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Mon, 10 Feb 2020 07:13:19 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [master/zeus/thud][PATCH] docker: install init script if sysvinit
Thread-Index: AQHV4BI7EfZZO1KvO0WpPcd/JuE/0qgUZ4nQ
Date: Mon, 10 Feb 2020 13:13:18 +0000
Message-ID: <d7c77ce1fe3543b78c0e9022ea3ae2ef@ti.com>
References: <1581339695-31008-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1581339695-31008-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [master/zeus/thud][PATCH] docker: install init script if sysvinit
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
X-List-Received-Date: Mon, 10 Feb 2020 13:15:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I checked again, and this is only applicable for thud.

Based on inspection, the issue has persisted into zeus and master, but the =
recipe names have changed.

- Jake

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Monday, February 10, 2020 8:02 AM
> To: meta-arago@arago-project.org
> Cc: Stiffler, Jacob
> Subject: [master/zeus/thud][PATCH] docker: install init script if sysvini=
t
>=20
> The docker recipe in meta-virtualization has conflicting logic for
> when to install and when to enable the docker initscript. When both
> systemd and sysvinit are in DISTRO_FEATURES, this causes the docker
> postinst to fail, which now fails the rootfs task.
>=20
> Here we install the initscript only based on if sysvinit is in the
> DISTRO_FEATURES.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-containers/docker/docker_git.bbappend | 8
> ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-
> containers/docker/docker_git.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-
> containers/docker/docker_git.bbappend b/meta-arago-distro/recipes-
> containers/docker/docker_git.bbappend
> new file mode 100644
> index 0000000..dbb7b04
> --- /dev/null
> +++ b/meta-arago-distro/recipes-containers/docker/docker_git.bbappend
> @@ -0,0 +1,8 @@
> +PR_append =3D ".tisdk0"
> +
> +do_install_append() {
> +	if
> ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; the=
n
> +		install -d ${D}${sysconfdir}/init.d
> +		install -m 0755 ${WORKDIR}/docker.init
> ${D}${sysconfdir}/init.d/docker.init
> +	fi
> +}
> --
> 1.9.1


