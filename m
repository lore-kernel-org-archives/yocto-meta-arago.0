Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id A524B52972
	for <meta-arago@arago-project.org>;
	Tue, 28 Jan 2014 20:27:35 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N040027NOTT6UN0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 28 Jan 2014 14:27:29 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EF8D0200E2; Tue,
	28 Jan 2014 15:27:27 -0500 (EST)
Date: Tue, 28 Jan 2014 15:27:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
Message-id: <20140128202727.GA6321@denix.org>
References: <1390259818-10267-1-git-send-email-fcooper@ti.com>
	<1390259818-10267-3-git-send-email-fcooper@ti.com>
	<20140120224548.GF24768@edge>
MIME-version: 1.0
In-reply-to: <20140120224548.GF24768@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 3/3] packagegroup-arago-test: Add useful testing tools
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
X-List-Received-Date: Tue, 28 Jan 2014 20:27:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 20, 2014 at 05:45:48PM -0500, Denys Dmytriyenko wrote:
> On Mon, Jan 20, 2014 at 05:16:58PM -0600, Franklin S. Cooper Jr wrote:
> > * Add two useful testing utilites to the arago filesystem.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-test.bb       |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> > index 399eea9..93a980f 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Extended task to get System Test specific apps"
> >  LICENSE = "MIT"
> > -PR = "r13"
> > +PR = "r14"
> >  
> >  inherit packagegroup
> >  
> > @@ -17,6 +17,8 @@ ARAGO_TEST = "\
> >      bc \
> >      memtester \
> >      libdrm-tests \
> > +    powertop \
> 
> This will add powertop-1.13 from oe-core - is that what you want?
> There's 2.3 in meta-linaro, which we don't use, though...

Franklin, please confirm the above.


> > +    stress \
> >      "
> >  
> >  ARAGO_TI_TEST = "\
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

