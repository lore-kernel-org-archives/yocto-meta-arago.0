Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BB2C02192
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 01:46:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6686.1738201558501788902
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 17:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 647DE40C83;
	Thu, 30 Jan 2025 01:45:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yu3x86vGgiem; Thu, 30 Jan 2025 01:45:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1D08C409EB;
	Thu, 30 Jan 2025 01:45:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 405D21641D9; Wed, 29 Jan 2025 20:45:51 -0500 (EST)
Date: Wed, 29 Jan 2025 20:45:51 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Ryan <reatmon@ti.com>,
	v-singh1@ti.com, Khasim <khasim@ti.com>, Andrew Davis <afd@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-arago][scarthgap][PATCH 1/1]
 meta-arago-extras: Add recipe for TFLite Runtime
Message-ID: <20250130014551.GK21836@denix.org>
References: <20250123172509.445473-1-c-shilwant@ti.com>
 <20250123172509.445473-2-c-shilwant@ti.com>
 <068aa65b-e965-4dec-a779-e9baa0a1f11b@ti.com>
 <20250123223529.GA21836@denix.org>
 <8f4738fd-a741-478c-ae31-e1afb2ec5ba2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f4738fd-a741-478c-ae31-e1afb2ec5ba2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jan 2025 01:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15781

On Fri, Jan 24, 2025 at 08:01:03PM +0530, Chirag Shilwant wrote:
> Hi Denys,
>=20
> On 24/01/25 04:05, Denys Dmytriyenko wrote:
> >> >+do_configure[network] =3D "1" > >+ > >+do_configure:=E2=80=8Aprepe=
nd() {
> >> >+ if [ -n "${http_proxy}" ]; then > >+ export
> >HTTP_PROXY=3D${http_proxy} > >+ export http_proxy=3D${http_proxy} > >+
> >fi > >+ >
> >ZjQcmQRYFpfptBannerStart
> >This message was sent from outside of Texas Instruments.
> >Do not click links or open attachments unless you recognize the
> >source of this email and know the content is safe.
> >Report=C2=A0Suspicious
> ><https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uPdqXRfP1m07amYk=
fLMjnW_0WPoGAUc_xiEhDJ8PA6NpT0xA8jTf-KB9808zSr3fgbwdqDV_S4_t$>
> >
> >ZjQcmQRYFpfptBannerEnd
> >> >+do_configure[network] =3D "1"
> >> >+
> >> >+do_configure:prepend() {
> >> >+    if [ -n "${http_proxy}" ]; then
> >> >+        export HTTP_PROXY=3D${http_proxy}
> >> >+        export http_proxy=3D${http_proxy}
> >> >+    fi
> >> >+
> >> >+    if [ -n "${https_proxy}" ]; then
> >> >+        export HTTPS_PROXY=3D${https_proxy}
> >> >+        export https_proxy=3D${https_proxy}
> >> >+    fi
> >> > > Are these checks needed? If it is unset then exporting
> >doesn't hurt,
> >> could replace all this with:
> >> > export http_proxy
> >> export https_proxy
> >> do_configure[network] =3D "1"
> >> > >+do_compile[network] =3D "1"
> >> >+
> >> >+do_compile:prepend() {
> >> >+    # Used to download cmake dependencies when behind a proxy
> >> >+    if [ -n "${http_proxy}" ]; then
> >> >+        export HTTP_PROXY=3D${http_proxy}
> >> >+        export http_proxy=3D${http_proxy}
> >> >+    fi
> >> >+
> >> >+    if [ -n "${https_proxy}" ]; then
> >> >+        export HTTPS_PROXY=3D${https_proxy}
> >> >+        export https_proxy=3D${https_proxy}
> >> >+    fi
> >> > Do you need network during compile? Seems to only be used in
> >configure.
> >
> >Both of the above will get you in trouble later on - these are conside=
red a
> >very bad antisocial behavior and an almost sure way to strip off of an=
y Yocto
> >Project Compatible status...
>=20
> I completely understand your concerns about following best practices
> in Yocto.
> I was aware that the Yocto documentation now recommends limiting
> network access
> to the do_fetch task. However, I'd like to point out that many
> official Yocto Project
> layers still enable network access after do_fetch.

You are missing my point...

"Yocto Project Compatible" is not merely saying a layer works with the Yo=
cto=20
Project.

It is a compliance and badging program that tests layers against a set of=
=20
defined criterias, recognizing those that pass as "Yocto Project Compatib=
le".

For example, meta-ti layers are Yocto Project Compatible since very early=
 days=20
and we kept it that way - it's being checked nightly on the YP autobuilde=
r.

On the other hand, meta-arago layers never had Yocto Project Compatible=20
designation.

Moreover, except meta-oe, none of the other layers you linked to are Yoct=
o=20
Project Compatible!


The "YP Compatible" program was "on hiatus" for quite some time, but is b=
eing=20
revamped now to re-launch some time in the near future - the Yocto Projec=
t=20
Technical Steering Committee has worked hard on the changes and I've been=
=20
closely involved - check the Technical Leadership tab here:
https://www.yoctoproject.org/about/leadership/

A wider range and more stricter criterias coming with this revamp are a d=
irect=20
result of misbehaving layers and all the pain they cause to the community=
.

For example, most of the QA checks are becoming mandatory:
https://git.openembedded.org/openembedded-core/commit/?id=3Dce2e42ace2d15=
fb6745437cf0a7f07d28398ca12

We'll be catching layers that try to skip those QA checks with INSANE_SKI=
P:
https://git.openembedded.org/openembedded-core/commit/?id=3D9c3ba88628853=
b20fb4c98c99cf3fe8349024016

And catching layers that use network outside of do_fetch() is in the work=
s:
https://git.yoctoproject.org/poky-contrib/tree/meta/classes-global/yocto-=
check-layer.bbclass?h=3Dross/checknetwork

All the corresponding documentation will be updated in due time...


You can find a rather short list of the past Yocto Project Compatible lay=
ers=20
that were recognzied and designated under the old program (new applicatio=
ns=20
are currently closed until the revamped program is out):
https://www.yoctoproject.org/development/yocto-project-compatible-layers/

For comparison, here's a much longer (but still not exhaustive) list of=20
registered YP layers - note how few of them have a little "YP Compatible"=
=20
badge next to their names:
https://layers.openembedded.org/layerindex/branch/master/layers/

And last week I also talked here on this list about efforts led by Ryan t=
o=20
improve meta-arago layers quality to potentially seek YP Compatible statu=
s=20
some time in the future:
https://lists.yoctoproject.org/g/meta-arago/message/15738

That's why in my reply to you I pointed out problematic areas and suggest=
ed=20
looking for better alternatives early on, before those become bigger issu=
es:


> >I'd suggest spending some time trying to find a way to do any and all
> >downloads inside the do_fetch() task, which is the only one allowed to=
 have
> >network access.
> >
> >In other words - do_configure() and do_compile() are definitely not th=
e right
> >places to do any network fetching...

But you are free to dismiss my recommendations...

--=20
Denys

