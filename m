Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id E126E52A20
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 22:34:45 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI20055YUPEXUU2@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Feb 2013 16:34:27 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 11CE620077; Mon,
	11 Feb 2013 17:34:25 -0500 (EST)
Date: Mon, 11 Feb 2013 17:34:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>
Message-id: <20130211223425.GA29903@denix.org>
References: <3C08AEEB3C731745938BC83D029FE5E3917A22@DFLE09.ent.ti.com>
	<20130211201310.GD11440@edge>
	<3C08AEEB3C731745938BC83D029FE5E391820B@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <3C08AEEB3C731745938BC83D029FE5E391820B@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: lzo recipe
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
X-List-Received-Date: Mon, 11 Feb 2013 22:34:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 11, 2013 at 10:25:40PM +0000, Zhou, Jingting wrote:
> 1. I don't know where it fits.(The lzo_2.06 is in oe-core)

lzo_2.06 is in recipes-support in oe-core


> 2. Now I recall why I re-added it. Vtun_2.6(I know it's a very old version, 
> released in 2003) depends on lzo_1.08. I added a vtun patch to be compatible 
> with lzo_2.06.

Can you update it to one of the latest from 3.0.x series? The latest 3.0.3 is 
from 2012...

-- 
Denys


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Monday, February 11, 2013 3:13 PM
> To: Zhou, Jingting
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] lzo recipe
> 
> On Wed, Feb 06, 2013 at 09:15:44PM +0000, Zhou, Jingting wrote:
> > Hey all, attached is the recipe for lzo. Please take a look. Thanks~
> 
> 1. Why did you put it in recipes-connectivity?
> 
> 2. Why do you even need to re-add it? oe-core already provides lzo_2.06
> 
> -- 
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

