Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C75F9529A7
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 16:48:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15Gmb5i002590
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 10:48:37 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15GmZEC015169
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 10:48:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 10:48:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15GmZGK007373;
	Thu, 5 Feb 2015 10:48:35 -0600
Date: Thu, 5 Feb 2015 11:48:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150205164835.GI9943@edge>
References: <1423148553-1225-1-git-send-email-ceh@ti.com>
	<20150205151353.GC9943@edge>
	<D03ED281-CA31-45D5-8623-3B6CDAD42EC8@ti.com>
	<20150205155225.GH9943@edge>
	<3F32BBC6-B86C-4BF0-9F1C-F3CBD996E665@ti.com>
MIME-Version: 1.0
In-Reply-To: <3F32BBC6-B86C-4BF0-9F1C-F3CBD996E665@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] busybox/defconfig: Enable options required by LAVA
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
X-List-Received-Date: Thu, 05 Feb 2015 16:48:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 10:59:24AM -0500, Cooper Jr., Franklin wrote:
> > On Feb 5, 2015, at 9:52 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
> >> On Thu, Feb 05, 2015 at 10:47:16AM -0500, Cooper Jr., Franklin wrote:
> >>>> On Feb 5, 2015, at 9:14 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
> >>>> 
> >>>> On Thu, Feb 05, 2015 at 10:02:33AM -0500, Carlos Hernandez wrote:
> >>>> Linaro's Test Framework (LAVA) requires httpd and other options
> >>>> enabled in busybox. Enable them so LAVA tests can be run on Arago
> >>>> images.
> >>> 
> >>> Looks good. The only concern I have is below.
> >> 
> >> Carlos,
> >> Do we really need another web server?
> >> We have lighttpd and thttpd already. Can either of those be reused 
> >> especially thttpd since it's already a light weight web server.
> > 
> > I guess this question would need to be directed to LAVA guys. Not sure if 
> > their build includes any of those other http servers, hence they enabled the 
> > simplest one.
> > 
> > We do indeed already have 2 http servers, and yes it would be nice to re-use 
> > one of them instead of enabling 3rd one. But the question is - who will 
> > validate and, if needed, update corresponding LAVA pieces to work with thttpd?

> Let me check how we currently use thttpd. I wouldn't mind replacing it with 
> httpd if possible instead of adding a third web server.

I don't believe we actively use thttpd any more. It was added way back to 
Classic Arago to support DVSDK and running cgi scripts as root:

http://arago-project.org/git/?p=arago.git;a=commit;h=f8bf614c85f435f53a78a0151b239341643f6a13

I'd vote to kill it.


> >>>> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> >>>> ---
> >>>> meta-arago-distro/recipes-core/busybox/busybox/defconfig | 12 ++++++------
> >>>> 1 file changed, 6 insertions(+), 6 deletions(-)
> >>>> 
> >>>> -# CONFIG_HTTPD is not set
> >>>> +CONFIG_HTTPD=y
> >>>> # CONFIG_FEATURE_HTTPD_RANGES is not set
> >>>> # CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
> >>>> # CONFIG_FEATURE_HTTPD_SETUID is not set
> >>>> @@ -845,7 +845,7 @@ CONFIG_UDHCP_DEBUG=0
> >>>> # CONFIG_FEATURE_UDHCP_8021Q is not set
> >>>> CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
> >>>> CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
> >>>> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
> >>>> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"
> >>> 
> >>> This supposedly changes udhcp behavior to go into background when waiting for 
> >>> an IP address, if not received right away, instead of exiting with an error.
> >>> I personally don't have an issue with this, but will it affect SDK OOB 
> >>> experience in any way? Guys?
> > 
> >> I'll double check but why instead of changing the default behavior simply 
> >> add &? I'm assuming you will get the same result but won't have to worry 
> >> about breaking anything.
> > 
> > That's still not the same - with -n flag udhcp will time out soon if not 
> > received IP address, while with -b it will go into background and will wait 
> > for IP address there. So, if you add & at the end of command with -n it will 
> > go into background, but exit soon after, which is not the same.
> > 
> So it sits indefinitely and assigns ip's whenever it can? If so I would 
> actual prefer that. I still need to check.

Yes, it is my understanding that it will keep on pinging the server with 
request-IP periodically in the background, until it gets one.

The current behaviour is it tries 3 times and if it can't get an IP, it exits 
with error.

In both cases, once the IP is acquired, the client has to stay in the 
background for renewing the lease. The difference is the initial acquision.

-- 
Denys

