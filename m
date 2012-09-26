Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id E850652AAC
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 03:29:44 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAX009TITOLRCZ0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 25 Sep 2012 22:29:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7529B201C1; Tue,
	25 Sep 2012 23:29:09 -0400 (EDT)
Date: Tue, 25 Sep 2012 23:29:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120926032909.GD8181@denix.org>
References: <1348587378-25412-1-git-send-email-fcooper@ti.com>
	<42E43DBC-7C8E-4F65-AEAB-6888AC38591E@ti.com>
MIME-version: 1.0
In-reply-to: <42E43DBC-7C8E-4F65-AEAB-6888AC38591E@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] crda: Port crda recipe from oe-classic
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
X-List-Received-Date: Wed, 26 Sep 2012 03:29:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 26, 2012 at 03:14:31AM +0000, Maupin, Chase wrote:
> Will you be sending this to meta-oe or oe-core.  An indication of the final 
> destination would be nice.
> 
> Also, we seem to be adding a lot of recipes to arago that will need to be 
> removed later.  Should we look into a layer or directory for these to help 
> us know what to check?

I would strongly advise against another layer. And putting them in a wrong 
directory makes it harder to bbappend or otherwise override them correctly.

So far there were 3 recipes that should go upstream, and removed locally when 
they exist there - thttpd, obexftp and ussp-push.

On the other hand - what if something is not accepted to any other layers? 
Since we need those recipe, we would end up hosting them in meta-arago-extras 
anyway. So, let's put them in proper place from the beginning.

-- 
Denys


> Sincerely,
> Chase Maupin
> 
> Sent from my iPad
> 
> On Sep 25, 2012, at 5:11 PM, "Franklin S. Cooper Jr" <fcooperjr27@gmail.com> wrote:
> 
> > * Port the crda recipe from oe-classic. The version in oe-classic
> >  was version 1.1.1
> > * Version 1.1.1 had compiling issues with the version of LIBNL used in oe-core.
> >  Upgraded version of crda to 1.1.2 which fixed that issue.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> > .../recipes-connectivity/crda/crda_1.1.2.bb        |   36 ++++++++++++++++++++
> > 1 files changed, 36 insertions(+), 0 deletions(-)
> > create mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
> > 
> > diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
> > new file mode 100644
> > index 0000000..82047db
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
> > @@ -0,0 +1,36 @@
> > +DESCRIPTION = "Wireless Central Regulatory Domain Agent"
> > +HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
> > +SECTION = "base"
> > +PRIORITY = "optional"
> > +LICENSE = "ISC"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
> > +
> > +PR = "r0"
> > +
> > +DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
> > +RDEPENDS_${PN} = "udev"
> > +
> > +SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
> > +    http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2011.04.28-regulatory.bin;name=reg \
> > +    "
> > +
> > +EXTRA_OEMAKE = "MAKEFLAGS="
> > +do_compile() {
> > +    oe_runmake all_noverify
> > +}
> > +
> > +do_install() {
> > +    oe_runmake DESTDIR=${D} install
> > +    install -d ${D}/usr/lib/crda/
> > +    install -m 0644 ${WORKDIR}/2011.04.28-regulatory.bin ${D}/usr/lib/crda/regulatory.bin
> > +}
> > +
> > +SRC_URI[crda.md5sum] = "5226f65aebacf94baaf820f8b4e06df4"
> > +SRC_URI[crda.sha256sum] = "e469348a5d0bb933df31995869130f68901de9be02e666437f52125698851864"
> > +SRC_URI[reg.md5sum] = "1535e98bcaba732e2f8e8f62dac6f369"
> > +SRC_URI[reg.sha256sum] = "bb6ba6f5dcdf7106a19c588b0e4d43ab7af26f6474fe01011a318b3dceaba33b"
> > +
> > +FILES_${PN} += "\
> > +    /lib/udev/rules.d/85-regulatory.rules \
> > +    /usr/lib/crda/regulatory.bin \
> > +    "
> > -- 
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

