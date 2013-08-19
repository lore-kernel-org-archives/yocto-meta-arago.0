Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id C76C052A24
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 17:38:21 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MRS00M43GZ6ZXM2@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 19 Aug 2013 12:37:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 71B5C20091; Mon,
	19 Aug 2013 13:37:53 -0400 (EDT)
Date: Mon, 19 Aug 2013 13:37:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Christian Gagneraud <chgans@gna.org>
Message-id: <20130819173753.GC32524@denix.org>
References: <520D8F5A.4000904@gna.org> <20130817150001.GD4931@edge>
	<52117D55.8010502@gna.org>
MIME-version: 1.0
In-reply-to: <52117D55.8010502@gna.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: u-boot-ti-staging failed to compile
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
X-List-Received-Date: Mon, 19 Aug 2013 17:38:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 19, 2013 at 02:05:09PM +1200, Christian Gagneraud wrote:
> On 18/08/13 03:00, Denys Dmytriyenko wrote:
> >On Fri, Aug 16, 2013 at 02:32:58PM +1200, Christian Gagneraud wrote:
> >>Hi there,
> >>
> >>I've started a brand new build today using arago-dylan-config.txt, I
> >>got a build failure with u-boot-ti-staging, the whole log is on
> >>pastebin [1].
> >>In short, I got:
> >>make[2]: *** No rule to make target `include/config_cmd_defaults',
> >>needed by `spl/arch/arm/cpu/armv7/cache_v7.o'.  Stop.
> >
> >Hmm, I haven't seen that one before. I'm building dylan for am335x-evm and it
> >includes u-boot-ti-staging that has no issues. What toolchain do you use?
> >
> 
> Hi Denys,
> 
> I didn't change anything, so I am still using
> linaro/arm-linux-gnueabihf/4.7-2013.03/, do I need a newer version?

No, that is the right one. Can you build that u-boot from sources manually?

-- 
Denys

