Return-Path: <anandb@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 10E7E52A7A
	for <meta-arago@arago-project.org>;
	Tue, 17 May 2016 16:42:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4HGgXV2004520
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 11:42:33 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HGgWCw000385
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 11:42:33 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HGgUbE001883
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 22:12:31 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Tue, 17 May 2016 22:12:30 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Chengalvala, Vivek"
	<vchengalvala@ti.com>, "Ruei, Eric" <e-ruei1@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] weston-init: add dependency on SGX
	DDK service
Thread-Index: AQHRr1TiXvDs03xEo0mm3SuYPKNGfp+7T+kAgAIG8DA=
Date: Tue, 17 May 2016 16:42:28 +0000
Message-ID: <05CF4794C98B244ABDC620C10903762273299257@DBDE04.ent.ti.com>
References: <1463390723-32245-1-git-send-email-anandb@ti.com>
	<20160516151240.GG16188@edge>
In-Reply-To: <20160516151240.GG16188@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/1] weston-init: add dependency on SGX DDK service
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
X-List-Received-Date: Tue, 17 May 2016 16:42:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,
Agreed. The intent of the patch was to fix only the out of sequence depende=
ncies between DDK and Weston.=20

Eric,
Is there a plan to update the Weston scripts to systemd?

Regards,
Anand

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, May 16, 2016 8:43 PM
To: Balagopalakrishnan, Anand
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/1] weston-init: add dependency on SGX DD=
K service

Anand,

This only solves one problem out of many - dependency on rc.pvr Unless we r=
ewrite the entirety of our custom weston init and runWeston scripts to beco=
me systemd units, we won't get all the fixes, workarounds and customization=
s we've added in the past years - calibration handling being the major of t=
hem...

--
Denys


On Mon, May 16, 2016 at 02:55:23PM +0530, Anand Balagopalakrishnan wrote:
> - systemd starts Weston service much before DDK initialization
> - Ensure that Weston service is started *after rc.pvr.service
>=20
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  .../wayland/weston-init/weston.service             |   16 ++++++++++++++=
++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-ini=
t/weston.service
>=20
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/westo=
n.service b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.s=
ervice
> new file mode 100644
> index 0000000..401c10e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.servi=
ce
> @@ -0,0 +1,16 @@
> +[Unit]
> +Description=3DWeston Wayland compositor startup
> +RequiresMountsFor=3D/run
> +After=3Drc.pvr.service
> +
> +[Service]
> +User=3Droot
> +EnvironmentFile=3D-/etc/default/weston
> +Environment=3D"XDG_RUNTIME_DIR=3D/run/user/root"
> +ExecStartPre=3D/bin/mkdir -p /run/user/root
> +ExecStartPre=3D/bin/chmod 0700 /run/user/root
> +ExecStart=3D/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> +
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

