Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CAACA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:15:36 +0000 (UTC)
Subject: Re: [oe-layersetup][master][PATCH] processor-sdk: Add new configs for AM62P PG.12 EA Release
To: meta-arago@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Firefox 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 05:15:29 -0700
References: <41989973-555e-492c-804a-4297de1fa243@ti.com>
In-Reply-To: <41989973-555e-492c-804a-4297de1fa243@ti.com>
Message-ID: <14236.1757074529955584471@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Sep 2025 12:15:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16533

On Fri, Sep  5, 2025 at 05:32 PM, Ryan Eatmon wrote:

>
>=20
> Should it be?
>=20
> 1) PG1.2
> 2) PG.1.2
>=20
> Or something else?
>=20

Yeah. It should be AM62P SR1.2 EA Release.=20


>=20
> On 9/5/2025 6:41 AM, Chirag Shilwant wrote:
> > In subject..shouldn't it be,
> >=20
> > s/12/1.2
> >=20
> > --=20
> > Chirag
> >=20
> > On 05/09/25 12:24, Jeevan via lists.yoctoproject.org wrote:
> >> - Add processor-sdk-scarthgap-chromium-11.01.12.10-config
> >> used for building AM62P.
> >>
> >> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> >> ---
> >> =C2=A0 ...scarthgap-chromium-11.01.12.10-config.json | 158 +++++++++++=
+++++
> >> =C2=A0 .../bblayers.conf.sample=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0
> 35 ++++
> >> =C2=A0 .../conf-notes.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> |=C2=A0 22 +++
> >> =C2=A0 .../conf-summary.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> |=C2=A0=C2=A0 1 +
> >> =C2=A0 .../local.conf.sample=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> 175 ++++++++++++++++++
> >> =C2=A0 ...-scarthgap-chromium-11.01.12.10-config.txt |=C2=A0 21 +++
> >> =C2=A0 ...-scarthgap-chromium-11.01.12.10-config.yml |=C2=A0 96 ++++++=
++++
> >> =C2=A0 ...-scarthgap-chromium-11.01.12.10-config.xml |=C2=A0 86 ++++++=
+++
> >> =C2=A0 8 files changed, 594 insertions(+)
> >> =C2=A0 create mode 100644=20
> >>
> bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-=
config.json
> >> =C2=A0 create mode 100644=20
> >>
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config/bblayers.conf.sample
> >> =C2=A0 create mode 100644=20
> >>
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config/conf-notes.txt
> >> =C2=A0 create mode 100644=20
> >>
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config/conf-summary.txt
> >> =C2=A0 create mode 100644=20
> >>
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config/local.conf.sample
> >> =C2=A0 create mode 100644=20
> >>
> configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config=
.txt
> >> =C2=A0 create mode 100644=20
> >> kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.=
yml
> >> =C2=A0 create mode 100644=20
> >>
> src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-co=
nfig.xml
> >>
> >> diff --git=20
> >>
> b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.1=
0-config.json
> >> new file mode 100644
> >> index 0000000..1036166
> >> --- /dev/null
> >> +++=20
> >>
> b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.1=
0-config.json
> >> @@ -0,0 +1,158 @@
> >> +{
> >> +=C2=A0 "version": "1.0",
> >> +=C2=A0 "description": "TI Processor SDK vchromium-11.01.12.10",
> >> +=C2=A0 "sources": {
> >> +=C2=A0=C2=A0=C2=A0 "oe-layersetup": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri":=20
> >> "https://git.ti.com/git/arago-project/oe-layersetup.git"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "master"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "oe-layersetup"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "bitbake": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri": "https://git.openembedded.org/bitbake"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "2.8"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "bitbake"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-tisdk": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri":
> "https://github.com/TexasInstruments/meta-tisdk.git"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-tisdk"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-arago": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri": "https://git.yoctoproject.org/meta-arago"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-arago"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-browser": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri":
> "https://github.com/OSSystems/meta-browser.git"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "master"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-browser"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-qt6": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri": "https://code.qt.io/yocto/meta-qt6.git"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "6.9"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-qt6"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-virtualization": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri":
> "https://git.yoctoproject.org/meta-virtualization"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-virtualization"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-openembedded": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri":
> "https://git.openembedded.org/meta-openembedded"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-openembedded"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-lts-mixins": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri":
> "https://git.yoctoproject.org/meta-lts-mixins"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap/rust"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-lts-mixins"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-ti": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri": "https://git.yoctoproject.org/meta-ti"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-ti"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-arm": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri": "https://git.yoctoproject.org/meta-arm"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-arm"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "meta-clang": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri": "https://github.com/kraj/meta-clang"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "meta-clang"
> >> +=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0 "oe-core": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "git-remote": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "remotes": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "u=
ri":
> "https://git.openembedded.org/openembedded-core"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rev": "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "oe-core"
> >> +=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0 },
> >> +=C2=A0 "configuration": {
> >> +=C2=A0=C2=A0=C2=A0 "bitbake-setup": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "default": {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "description": "Default bu=
ild configuration",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "template":=20
> >>
> "oe-layersetup-processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10=
-config",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "targets": [ "bitbak=
e -k tisdk-default-image" ]
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0 }
> >> +}
> >> diff --git=20
> >>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/bblayers.conf.sample
> >> new file mode 100644
> >> index 0000000..340048b
> >> --- /dev/null
> >> +++=20
> >>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/bblayers.conf.sample
> >> @@ -0,0 +1,35 @@
> >> +# This template file was created by taking the=20
> >> oe-core/meta/conf/bblayers.conf
> >> +# file and removing the BBLAYERS section at the end.
> >> +
> >> +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> >> +# changes incompatibly
> >> +LCONF_VERSION =3D "5"
> >> +
> >> +BBPATH =3D "${TOPDIR}"
> >> +BBFILES ?=3D ""
> >> +
> >> +BBLAYERS ?=3D " \
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-tisdk/meta-ti-foundational
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-tisdk/meta-ti-ml
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-arago/meta-arago-distro
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-arago/meta-arago-extras
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-arago/meta-arago-test
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-browser/meta-chromium
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-qt6
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-virtualization
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-openembedded/meta-networking
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-openembedded/meta-python
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-openembedded/meta-oe
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-openembedded/meta-gnome
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-openembedded/meta-filesystems
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-openembedded/meta-multimedia
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-lts-mixins
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-ti/meta-ti-extras
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-ti/meta-beagle
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-ti/meta-ti-bsp
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-arm/meta-arm
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-arm/meta-arm-toolchain
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../meta-clang
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../oe-core/meta
> >> +=C2=A0=C2=A0=C2=A0 ##OEROOT##/../oe-layersetup
> >> +"
> >> diff --git=20
> >>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/conf-notes.txt
> >> new file mode 100644
> >> index 0000000..1880460
> >> --- /dev/null
> >> +++=20
> >>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/conf-notes.txt
> >> @@ -0,0 +1,22 @@
> >> +
> >> +### Shell environment set up for builds. ###
> >> +
> >> +You can now run 'bitbake <target>'
> >> +
> >> +If you have not set MACHINE in your local.conf you can run
> >> +'MACHINE=3Dxxxxx bitbake <target>'
> >> +
> >> +Common targets are:
> >> +=C2=A0=C2=A0=C2=A0 tisdk-default-image
> >> +=C2=A0=C2=A0=C2=A0 tisdk-base-image
> >> +=C2=A0=C2=A0=C2=A0 tisdk-bootstrap-base-image
> >> +=C2=A0=C2=A0=C2=A0 tisdk-bootstrap-image
> >> +=C2=A0=C2=A0=C2=A0 tisdk-thinlinux-image
> >> +=C2=A0=C2=A0=C2=A0 tisdk-tiny-image
> >> +
> >> +You can also run generated qemu images with a command like 'runqemu=
=20
> >> qemux86-64'.
> >> +
> >> +Other commonly useful commands are:
> >> + - 'devtool' and 'recipetool' handle common recipe tasks
> >> + - 'bitbake-layers' handles common layer tasks
> >> + - 'oe-pkgdata-util' handles common target package tasks
> >> diff --git=20
> >>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/conf-summary.txt
> >> new file mode 100644
> >> index 0000000..bd63f9a
> >> --- /dev/null
> >> +++=20
> >>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/conf-summary.txt
> >> @@ -0,0 +1 @@
> >> +TI Processor SDK vchromium-11.01.12.10
> >> diff --git=20
> >>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/local.conf.sample
> >> new file mode 100644
> >> index 0000000..8ad6f26
> >> --- /dev/null
> >> +++=20
> >>
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.=
10-config/local.conf.sample
> >> @@ -0,0 +1,175 @@
> >> +# CONF_VERSION is increased each time build/conf/ changes incompatibl=
y
> >> +CONF_VERSION =3D "2"
> >> +
> >> +#
> >> +# Where to place downloads
> >> +#
> >> +# During a first build the system will download many different source=
=20
> >> code
> >> +# tarballs from various upstream projects. This can take a while,=20
> >> particularly
> >> +# if your network connection is slow. These are all stored in DL_DIR.=
=20
> >> When
> >> +# wiping and rebuilding you can preserve this directory to speed up=
=20
> >> this part
> >> +# of subsequent builds. This directory is safe to share between=20
> >> multiple builds
> >> +# on the same machine too.
> >> +DL_DIR =3D "${TOPDIR}/../downloads"
> >> +
> >> +#
> >> +# Where to place shared-state files
> >> +#
> >> +# BitBake has the capability to accelerate builds based on previously=
=20
> >> built
> >> +# output. This is done using "shared state" files which can be=20
> >> thought of as
> >> +# cache objects and this option determines where those files are plac=
ed.
> >> +#
> >> +# You can wipe out TMPDIR leaving this directory intact and the build=
=20
> >> would
> >> +# regenerate from these files if no changes were made to the=20
> >> configuration.
> >> +# If changes were made to the configuration, only shared state files=
=20
> >> where the
> >> +# state was still valid would be used (done using checksums).
> >> +SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> >> +
> >> +#
> >> +# Shared-state files from other locations
> >> +#
> >> +# As mentioned above, shared state files are prebuilt cache data=20
> >> objects which
> >> +# can be used to accelerate build time. This variable can be used to=
=20
> >> configure
> >> +# the system to search other mirror locations for these objects=20
> >> before it
> >> +# builds the data itself.
> >> +#
> >> +# This can be a filesystem directory, or a remote url such as http or=
=20
> >> ftp.
> >> +# These would contain the sstate-cache results from previous builds=
=20
> >> (possibly
> >> +# from other machines). This variable works like fetcher=20
> >> MIRRORS/PREMIRRORS
> >> +# and points to the cache locations to check for the shared objects.
> >> +#SSTATE_MIRRORS ?=3D "\
> >> +#file://.* http://someserver.tld/share/sstate/ \n \
> >> +#file://.* file:///some/local/dir/sstate/"
> >> +
> >> +#
> >> +# Where to place the build output
> >> +#
> >> +# This option specifies where the bulk of the building work should be=
=20
> >> done and
> >> +# where BitBake should place its temporary files and output. Keep in=
=20
> >> mind that
> >> +# this includes the extraction and compilation of many applications=
=20
> >> and the toolchain
> >> +# which can use Gigabytes of hard disk space.
> >> +TMPDIR =3D "${TOPDIR}/arago-tmp"
> >> +
> >> +# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to=
=20
> >> be outside
> >> +#DEPLOY_DIR =3D "${TOPDIR}/deploy"
> >> +
> >> +#
> >> +# Machine Selection
> >> +#
> >> +# You need to select a specific machine to target the build with.=20
> >> There are a selection
> >> +# of emulated machines available which can boot and run in the QEMU=
=20
> >> emulator:
> >> +#
> >> +#MACHINE ?=3D "arago"
> >> +
> >> +#
> >> +# Package Management configuration
> >> +#
> >> +# This variable lists which packaging formats to enable. Multiple=20
> >> package backends
> >> +# can be enabled at once and the first item listed in the variable=20
> >> will be used
> >> +# to generate the root filesystems.
> >> +# Options are:
> >> +#=C2=A0 - 'package_deb' for debian style deb files
> >> +#=C2=A0 - 'package_ipk' for ipk files are used by opkg (a debian styl=
e=20
> >> embedded package manager)
> >> +#=C2=A0 - 'package_rpm' for rpm style packages
> >> +# E.g.: PACKAGE_CLASSES ?=3D "package_rpm package_deb package_ipk"
> >> +# We default to ipk:
> >> +PACKAGE_CLASSES ?=3D "package_ipk"
> >> +
> >> +#
> >> +# SDK/ADT target architecture
> >> +#
> >> +# This variable specified the architecture to build SDK/ADT items for=
=20
> >> and means
> >> +# you can build the SDK packages for architectures other than the=20
> >> machine you are
> >> +# running the build on (i.e. building i686 packages on an x86_64 host=
._
> >> +# Supported values are i686 and x86_64
> >> +SDKMACHINE ?=3D "x86_64"
> >> +
> >> +#
> >> +# Extra image configuration defaults
> >> +#
> >> +# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added=
=20
> >> to the generated
> >> +# images. Some of these options are added to certain image types=20
> >> automatically. The
> >> +# variable can contain the following options:
> >> +#=C2=A0 "dbg-pkgs"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add -dbg pac=
kages for all installed packages
> >> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (adds symbol informa=
tion for
> debugging/profiling)
> >> +#=C2=A0 "dev-pkgs"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add -dev pac=
kages for all installed packages
> >> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (useful if you want =
to develop
> against libs in=20
> >> the image)
> >> +#=C2=A0 "tools-sdk"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add development t=
ools (gcc, make, pkgconfig
> etc.)
> >> +#=C2=A0 "tools-debug"=C2=A0=C2=A0=C2=A0 - add debugging tools (gdb, s=
trace)
> >> +#=C2=A0 "tools-profile"=C2=A0 - add profiling tools (oprofile, exmap,=
 lttng=20
> >> valgrind (x86 only))
> >> +#=C2=A0 "tools-testapps" - add useful testing tools (ts_print, aplay,=
=20
> >> arecord etc.)
> >> +#=C2=A0 "debug-tweaks"=C2=A0=C2=A0 - make an image suitable for devel=
opment
> >> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e.g. ssh root access=
 has a blank
> password
> >> +# There are other application targets that can be used here too, see
> >> +# meta/classes/image.bbclass and meta/classes/core-image.bbclass for=
=20
> >> more details.
> >> +# We default to enabling the debugging tweaks.
> >> +EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> >> +
> >> +#
> >> +# Additional image features
> >> +#
> >> +# The following is a list of additional classes to use when building=
=20
> >> images which
> >> +# enable extra features. Some available options which can be included=
=20
> >> in this variable
> >> +# are:
> >> +#=C2=A0=C2=A0 - 'buildstats' collect build statistics
> >> +#=C2=A0=C2=A0 - 'image-swab' to perform host system intrusion detecti=
on
> >> +# NOTE: mklibs also needs to be explicitly enabled for a given image,=
=20
> >> see local.conf.extended
> >> +USER_CLASSES ?=3D "buildstats"
> >> +
> >> +# By default disable interactive patch resolution (tasks will just=20
> >> fail instead):
> >> +PATCHRESOLVE =3D "noop"
> >> +
> >> +# By default the machine configuration file sets the IMAGE_FSTYPES. =
=20
> >> But if you
> >> +# would like to add additional file system types you can uncomment th=
e
> >> +# following line and add the additional IMAGE_FSTYPES you want create=
d
> >> +# as part of the build flow.=C2=A0 Some common types are listed below=
 and you
> >> +# can remove the ones you do not want.
> >> +# IMAGE_FSTYPES +=3D "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.g=
z=20
> >> tar.bz2 cpio"
> >> +
> >> +#
> >> +# Parallelism Options
> >> +#
> >> +# These two options control how much parallelism BitBake should use.=
=20
> >> The first
> >> +# option determines how many tasks bitbake should run in parallel:
> >> +#
> >> +# BB_NUMBER_THREADS ?=3D "1"
> >> +#
> >> +# The second option controls how many processes make should run in=20
> >> parallel when
> >> +# running compile tasks:
> >> +#
> >> +# PARALLEL_MAKE ?=3D "-j 1"
> >> +#
> >> +# For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =
=3D=20
> >> "-j 4" would
> >> +# be appropriate for example
> >> +#
> >> +# NOTE: By default, bitbake will choose the number of processeors on=
=20
> >> your host
> >> +# so you should not need to set this unless you are wanting to lower=
=20
> >> the number
> >> +# allowed.
> >> +#
> >> +
> >> +DISTRO=C2=A0=C2=A0 =3D "arago"
> >> +
> >> +# Set terminal types by default it expects gnome-terminal
> >> +# but we chose xterm
> >> +TERMCMD =3D "${XTERM_TERMCMD}"
> >> +TERMCMDRUN =3D "${XTERM_TERMCMDRUN}"
> >> +
> >> +# Don't generate the mirror tarball for SCM repos, the snapshot is=20
> >> enough
> >> +BB_GENERATE_MIRROR_TARBALLS =3D "0"
> >> +
> >> +# Uncomment this to remove work directory after packaging to save=20
> >> disk space
> >> +#INHERIT +=3D "rm_work"
> >> +
> >> +# Keep one set of images by default
> >> +RM_OLD_IMAGE =3D "1"
> >> +
> >> +# Enable local PR service for binary feeds
> >> +PRSERV_HOST =3D "localhost:0"
> >> +
> >> +# Enable hash equiv server
> >> +BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> >> +BB_HASHSERVE =3D "auto"
> >> +
> >> +# It is recommended to activate "buildhistory" for testing the PR=20
> >> service
> >> +INHERIT +=3D "buildhistory"
> >> +BUILDHISTORY_COMMIT =3D "1"
> >> diff --git=20
> >>
> b/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-conf=
ig.txt
> >> new file mode 100644
> >> index 0000000..dae4f9f
> >> --- /dev/null
> >> +++=20
> >>
> b/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-conf=
ig.txt
> >> @@ -0,0 +1,21 @@
> >> +# This file takes repo entries in the format
> >> +# repo name,repo uri,repo branch,repo=20
> >> commit[,layers=3Dlayer1:layer2...:layern]
> >> +
> >>
> +bitbake,https://git.openembedded.org/bitbake,2.8,982645110a19ebb94d51992=
6a4e14c8a2a205cfd
> >>
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
11.01.12.10,layers=3Dmeta-ti-foundational:meta-ti-ml
> >>
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.01.12,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
> >>
> +meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52=
f635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
> >>
> +#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,0bb4a3=
4a5e102c5264215bfaedddb13703270afa,layers=3D
> >>
> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,2033d6b48e6f5258b101f=
e433c90ebdb9c22f643,layers=3D
> >>
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,02f72c96bf9acd0bd3ae0463f482bce8feabe749,layers=3D
> >>
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,c29a18fa39ede952f3f6108ec007c1906e2d9a0d,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> >>
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/r=
ust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
> >>
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.01.12,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> >>
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,8e0f8af90fefb03=
f08cd2228cde7a89902a6b37c,layers=3Dmeta-arm:meta-arm-toolchain
> >>
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,6691e4bc47e20b90=
3dc3dd7684685086d2468b84,layers=3D
> >>
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap=
,0bb4a34a5e102c5264215bfaedddb13703270afa,layers=3D.:meta-flutter-apps
> >>
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,93c7489=
d843a0e46fe4fc685b356d0ae885300d7,layers=3Dmeta
> >> +
> >> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> >> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> >> +BITBAKE_INCLUSIVE_VARS=3Dyes
> >> diff --git=20
> >> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-confi=
g.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.y=
ml
> >> new file mode 100644
> >> index 0000000..e2353d4
> >> --- /dev/null
> >> +++=20
> >> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-confi=
g.yml
> >> @@ -0,0 +1,96 @@
> >> +---
> >> +header:
> >> +=C2=A0 version: 17
> >> +=C2=A0 includes:
> >> +=C2=A0=C2=A0=C2=A0 - ../templates/bblayers.conf.yml
> >> +=C2=A0=C2=A0=C2=A0 - ../templates/local-arago64-v2.conf.yml
> >> +
> >> +target: tisdk-default-image
> >> +
> >> +repos:
> >> +=C2=A0 bitbake:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://git.openembedded.org/bitbake"
> >> +=C2=A0=C2=A0=C2=A0 branch: "2.8"
> >> +=C2=A0=C2=A0=C2=A0 commit: "982645110a19ebb94d519926a4e14c8a2a205cfd"
> >> +=C2=A0=C2=A0=C2=A0 layers:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .: disabled
> >> +
> >> +=C2=A0 meta-tisdk:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://github.com/TexasInstruments/meta-tis=
dk.git"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0 commit: "11.01.12.10"
> >> +=C2=A0=C2=A0=C2=A0 layers:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-ti-foundational:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-ti-ml:
> >> +
> >> +=C2=A0 meta-arago:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://git.yoctoproject.org/meta-arago"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0 commit: "11.01.12"
> >> +=C2=A0=C2=A0=C2=A0 layers:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-arago-distro:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-arago-extras:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-arago-test:
> >> +
> >> +=C2=A0 meta-browser:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://github.com/OSSystems/meta-browser.gi=
t"
> >> +=C2=A0=C2=A0=C2=A0 branch: "master"
> >> +=C2=A0=C2=A0=C2=A0 commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
> >> +=C2=A0=C2=A0=C2=A0 layers:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-chromium:
> >> +
> >> +=C2=A0 meta-qt6:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://code.qt.io/yocto/meta-qt6.git"
> >> +=C2=A0=C2=A0=C2=A0 branch: "6.9"
> >> +=C2=A0=C2=A0=C2=A0 commit: "2033d6b48e6f5258b101fe433c90ebdb9c22f643"
> >> +
> >> +=C2=A0 meta-virtualization:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://git.yoctoproject.org/meta-virtualiza=
tion"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0 commit: "02f72c96bf9acd0bd3ae0463f482bce8feabe749"
> >> +
> >> +=C2=A0 meta-openembedded:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://git.openembedded.org/meta-openembedd=
ed"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0 commit: "c29a18fa39ede952f3f6108ec007c1906e2d9a0d"
> >> +=C2=A0=C2=A0=C2=A0 layers:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-networking:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-python:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-oe:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-gnome:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-filesystems:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-multimedia:
> >> +
> >> +=C2=A0 meta-lts-mixins:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://git.yoctoproject.org/meta-lts-mixins=
"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap/rust"
> >> +=C2=A0=C2=A0=C2=A0 commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
> >> +
> >> +=C2=A0 meta-ti:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://git.yoctoproject.org/meta-ti"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0 commit: "11.01.12"
> >> +=C2=A0=C2=A0=C2=A0 layers:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-ti-extras:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-beagle:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-ti-bsp:
> >> +
> >> +=C2=A0 meta-arm:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://git.yoctoproject.org/meta-arm"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0 commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
> >> +=C2=A0=C2=A0=C2=A0 layers:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-arm:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-arm-toolchain:
> >> +
> >> +=C2=A0 meta-clang:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://github.com/kraj/meta-clang"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0 commit: "6691e4bc47e20b903dc3dd7684685086d2468b84"
> >> +
> >> +=C2=A0 oe-core:
> >> +=C2=A0=C2=A0=C2=A0 url: "https://git.openembedded.org/openembedded-co=
re"
> >> +=C2=A0=C2=A0=C2=A0 branch: "scarthgap"
> >> +=C2=A0=C2=A0=C2=A0 commit: "93c7489d843a0e46fe4fc685b356d0ae885300d7"
> >> +=C2=A0=C2=A0=C2=A0 layers:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta:
> >> diff --git=20
> >>
> b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-=
config.xml
> >> new file mode 100644
> >> index 0000000..5793c01
> >> --- /dev/null
> >> +++=20
> >>
> b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-=
config.xml
> >> @@ -0,0 +1,86 @@
> >> +<?xml version=3D'1.0'?>
> >> +<config>
> >> +=C2=A0=C2=A0=C2=A0 <description>TI Processor SDK vchromium-11.01.12.1=
0</description>
> >> +
> >> +=C2=A0=C2=A0=C2=A0 <xi:include href=3D'../../common/targets_arago.xml=
'=20
> >> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> >> +=C2=A0=C2=A0=C2=A0 <xi:include href=3D'../../templates/bblayers.conf.=
xml'=20
> >> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> >> +=C2=A0=C2=A0=C2=A0 <xi:include href=3D'../../templates/local-arago64-=
v2.conf.xml'=20
> >> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> >> +
> >> +=C2=A0=C2=A0=C2=A0 <bitbake url=3D'https://git.openembedded.org/bitba=
ke' branch=3D'2.8'=20
> >> commit=3D'982645110a19ebb94d519926a4e14c8a2a205cfd'/>
> >> +
> >> +=C2=A0=C2=A0=C2=A0 <repos>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-tisdk'=
=20
> >> url=3D'https://github.com/TexasInstruments/meta-tisdk.git'=20
> >> branch=3D'scarthgap' commit=3D'11.01.12.10'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-ti-foundational</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-ti-ml</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
layers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-arago'=
=20
> >> url=3D'https://git.yoctoproject.org/meta-arago' branch=3D'scarthgap'=
=20
> >> commit=3D'11.01.12'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-arago-distro</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-arago-extras</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-arago-test</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
layers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-browser=
'=20
> >> url=3D'https://github.com/OSSystems/meta-browser.git' branch=3D'master=
'=20
> >> commit=3D'27ca52f635a31f5f9762813a8527dd31323549b7'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-chromium</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
layers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-selinux=
'=20
> >> url=3D'https://git.yoctoproject.org/meta-selinux' branch=3D'scarthgap'=
=20
> >> commit=3D'0bb4a34a5e102c5264215bfaedddb13703270afa' disabled=3D'true'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers/>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-qt6'=20
> >> url=3D'https://code.qt.io/yocto/meta-qt6.git' branch=3D'6.9'=20
> >> commit=3D'2033d6b48e6f5258b101fe433c90ebdb9c22f643'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers/>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-virtual=
ization'=20
> >> url=3D'https://git.yoctoproject.org/meta-virtualization'=20
> >> branch=3D'scarthgap' commit=3D'02f72c96bf9acd0bd3ae0463f482bce8feabe74=
9'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers/>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-openemb=
edded'=20
> >> url=3D'https://git.openembedded.org/meta-openembedded'=20
> >> branch=3D'scarthgap' commit=3D'c29a18fa39ede952f3f6108ec007c1906e2d9a0=
d'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-networking</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-python</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-oe</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-gnome</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-filesystems</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-multimedia</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
layers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-lts-mix=
ins'=20
> >> url=3D'https://git.yoctoproject.org/meta-lts-mixins'=20
> >> branch=3D'scarthgap/rust'=20
> >> commit=3D'a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers/>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-ti'=20
> >> url=3D'https://git.yoctoproject.org/meta-ti' branch=3D'scarthgap'=20
> >> commit=3D'11.01.12'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-ti-extras</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-beagle</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-ti-bsp</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
layers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-arm'=20
> >> url=3D'https://git.yoctoproject.org/meta-arm' branch=3D'scarthgap'=20
> >> commit=3D'8e0f8af90fefb03f08cd2228cde7a89902a6b37c'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-arm</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-arm-toolchain</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
layers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-clang'=
=20
> >> url=3D'https://github.com/kraj/meta-clang' branch=3D'scarthgap'=20
> >> commit=3D'6691e4bc47e20b903dc3dd7684685086d2468b84'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers/>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-flutter=
'=20
> >> url=3D'https://github.com/meta-flutter/meta-flutter.git'=20
> >> branch=3D'scarthgap' commit=3D'0bb4a34a5e102c5264215bfaedddb13703270af=
a'=20
> >> disabled=3D'true'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>.</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta-flutter-apps</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
layers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'oe-core'=20
> >> url=3D'https://git.openembedded.org/openembedded-core'=20
> >> branch=3D'scarthgap' commit=3D'93c7489d843a0e46fe4fc685b356d0ae885300d=
7'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <l=
ayers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <layer>meta</layer>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
layers>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
> >> +=C2=A0=C2=A0=C2=A0 </repos>
> >> +
> >> +=C2=A0=C2=A0=C2=A0 <tools>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <tool type=3D'oe-layersetu=
p'>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <v=
ar name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </tool>
> >> +=C2=A0=C2=A0=C2=A0 </tools>
> >> +</config>
>=20
> --=20
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>

