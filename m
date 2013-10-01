Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8B1215296F
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:42:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DgJBr028165
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:42:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DgJJ1030298
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:42:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 08:42:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DgI4m032230;
	Tue, 1 Oct 2013 08:42:19 -0500
Date: Tue, 1 Oct 2013 09:42:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131001134218.GH26572@edge>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-2-git-send-email-denis@denix.org>
	<4A108B9F-2318-433C-AD91-09D666643367@ti.com>
MIME-Version: 1.0
In-Reply-To: <4A108B9F-2318-433C-AD91-09D666643367@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 01/13] arago-dylan-config: add meta-qt5/master and dependency on meta-ruby from meta-oe
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
X-List-Received-Date: Tue, 01 Oct 2013 13:42:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 01, 2013 at 01:38:57PM +0000, Cooper Jr., Franklin wrote:
> Ack. I'm hoping ruby doesn't need to be installed on the fs for Qt to run.

I believe the only dependency is ruby-native needed somewhere during the 
build. At least I don't see it in the image or even there are not target 
packages produced.


> > On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > configs/arago-dylan-config.txt | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/configs/arago-dylan-config.txt b/configs/arago-dylan-config.txt
> > index 59055bd..f5fb666 100644
> > --- a/configs/arago-dylan-config.txt
> > +++ b/configs/arago-dylan-config.txt
> > @@ -3,7 +3,8 @@
> > 
> > bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
> > meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
> > -meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-oe
> > +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> > +meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
> > meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
> > meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
> > oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
> > -- 
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

