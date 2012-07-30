Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E30F4529EF
	for <meta-arago@arago-project.org>;
	Mon, 30 Jul 2012 23:05:02 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6UN512d008298;
	Mon, 30 Jul 2012 18:05:02 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6UN51wT028019;
	Mon, 30 Jul 2012 18:05:01 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 30 Jul 2012 18:05:01 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCHES] Porting Busybox from arago to meta-arago
Thread-Index: Ac1sLgkXm9uyUMjGSC2gxcA4VrninACoM7qA//+xzpQ=
Date: Mon, 30 Jul 2012 23:05:01 +0000
Message-ID: <54312E86-1976-41C7-80B8-33F96CC66D38@ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C27A517@DFLE30.ent.ti.com>,
	<20120730224453.GC11175@denix.org>
In-Reply-To: <20120730224453.GC11175@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHES] Porting Busybox from arago to meta-arago
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
X-List-Received-Date: Mon, 30 Jul 2012 23:05:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

It is rarely clear why certain changes were=20
made in arago/oe-classic. Since my focus now is only am335x I personally ra=
ther not guess what isn't needed since it might cause issues for other Sita=
ra devices.

I do agree that we should only bother porting what is needed. But I will ne=
ed everyone's feedback to point out these unneeded changes.=20

On Jul 30, 2012, at 5:45 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:

> On Fri, Jul 27, 2012 at 07:28:44PM +0000, Cooper Jr., Franklin wrote:
>> The attached patches are for porting the amended recipe and file from ar=
ago=20
>> to meta-arago.
>>=20
>> The patch 0002-busybox-Port-defconfig-changes-from-oe-classic takes the=
=20
>> default defconfig (http://goo.gl/L9dcd) in oe-core and tries to reapply =
the=20
>> configuration options that were in the old version (http://goo.gl/WFbNw)=
 =20
>> located in the arago repository. Most of the effort was to ensure that=20
>> configuration options that were enabled previous were also enabled in th=
is=20
>> updated defconfig file.
>>=20
>> There were several options in the old defconfig that I couldn't find a=20
>> comparable option for in the new defconfig or I was simply unsure if the=
y=20
>> were really equal:
>>=20
>> Couldn't find in latest defconfig file in oe-core:
>> CONFIG_FEATURE_DIFF_BINARY
>> CONFIG_FEATURE_DIFF_MINIMAL
>> CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP
>> CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_WITH_MIME_TYPES
>> CONFIG_ASH_READ_NCHARS
>>=20
>> Similar configuration names but not quite sure if they are indeed the sa=
me:
>> CONFIG_ASH_READ_TIMEOUT - arago might be the same as CONFIG_ASH_IDLE_TIM=
EOUT=20
>> - oe-core
>>=20
>> Are the above discrepancies ok to leave out or does anyone have suggesti=
ons=20
>> on how what to do with them?
>=20
> Franklin,
>=20
> The patches look fine, but do we need to port all the configuration optio=
ns=20
> from Classic OE? We may only need few of them - should we instead identif=
y the=20
> list of what is required and leave the rest of the descrepancy alone?
>=20
> --=20
> Denys

