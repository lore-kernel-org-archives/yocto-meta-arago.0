Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310E1D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 05:50:52 +0000 (UTC)
Subject: Re: [master][PATCH v2 1/2] gstreamer1.0-plugins-good: Add QT6 PACKAGECONFIG support
To: meta-arago@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.10)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 Jan 2026 21:50:51 -0800
References: <20260116143722.2135247-1-j-sahu@ti.com> <c9350640-cf97-4939-b788-63173838cd35@ti.com>
In-Reply-To: <c9350640-cf97-4939-b788-63173838cd35@ti.com>
Message-ID: <256810.1768888251478858363@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 05:50:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16984

On Fri, Jan 16, 2026 at 11:47 PM, Andrew Davis wrote:

>
> On 1/16/26 8:37 AM, Jeevan via lists.yoctoproject.org wrote:
> > GStreamer's Qt6 qmlgl plugin enables video rendering in Qt6/QML applica=
tions
> > by providing GstGLVideoItem QML element. This plugin is essential for
> > integrating GStreamer pipelines with Qt6 Quick/QML user interfaces.
> >=20
> > Enable Qt6 PACKAGECONFIG to build the qmlgl plugin when qt6-layer is pr=
esent
> > utilizing dynamic-layer.
> >=20
> > Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> > ---
> >   meta-arago-extras/conf/layer.conf                     |  4 ++++
> >   .../gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc  | 11 ++++++++++=
+
> >   .../gstreamer1.0-plugins-good_1.26.%.bbappend         |  4 ++++
> >   3 files changed, 19 insertions(+)
> >   create mode 100644
> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/g=
streamer1.0-plugins-good_1.26-qt6.inc
> >   create mode 100644
> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/g=
streamer1.0-plugins-good_1.26.%.bbappend
> >=20
> > diff --git a/meta-arago-extras/conf/layer.conf
> b/meta-arago-extras/conf/layer.conf
> > index 3927a913..1a4a5bdd 100644
> > --- a/meta-arago-extras/conf/layer.conf
> > +++ b/meta-arago-extras/conf/layer.conf
> > @@ -22,3 +22,7 @@ LAYERDEPENDS_meta-arago-extras =3D " \
> >       networking-layer \
> >       openembedded-layer \
> >   "
> > +
> > +BBFILES_DYNAMIC +=3D " \
> > +    qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappe=
nd \
> > +"
> > diff --git
> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.26-qt6.inc
> > new file mode 100644
> > index 00000000..e30440e1
> > --- /dev/null
> > +++
> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.26-qt6.inc
> > @@ -0,0 +1,11 @@
> > +PACKAGECONFIG:append =3D " qt6"
> > +
> > +QT6WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "waylan=
d",
> "qtwayland", "", d)}"
> > +
> > +PACKAGECONFIG[qt6] =3D "-Dqt6=3Denabled, -Dqt6=3Ddisabled, qtbase qtba=
se-native
> qtdeclarative qttools-native ${QT6WAYLANDDEPENDS}"
>=20
> This part could be sent upstream to oe-core master.
>=20
> Andrew
>=20

Good point. I have sent the patch to oe-core master[0].

[0]: https://lists.openembedded.org/g/openembedded-core/message/229607

> > +
> > +# Qt tools like rcc, moc and uic are located in /usr/libexec, instead =
of
> > +# /usr/bin, which is not in PATH by default.
> > +do_configure:prepend:class-target() {
> > +	export PATH=3D${STAGING_DIR_NATIVE}${libexecdir}:$PATH
> > +}
> > diff --git
> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.26.%.bbappend
> > new file mode 100644
> > index 00000000..27426f4d
> > --- /dev/null
> > +++
> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.26.%.bbappend
> > @@ -0,0 +1,4 @@
> > +GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6 =3D ""
> > +GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6:arago =3D
> "gstreamer1.0-plugins-good_1.26-qt6.inc"
> > +
> > +require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6}
>=20
>

