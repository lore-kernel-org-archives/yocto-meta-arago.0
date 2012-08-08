Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 979A452A78
	for <meta-arago@arago-project.org>;
	Wed,  8 Aug 2012 02:31:12 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8F00H5W0BSG8BL@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Aug 2012 21:31:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DAE1420385; Tue,
	07 Aug 2012 22:31:03 -0400 (EDT)
Date: Tue, 07 Aug 2012 22:31:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120808023103.GC32275@denix.org>
References: <8F29D6B095ED194EA1980491A5E029710C27EB14@DFLE30.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C27EB14@DFLE30.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] opkg: Port opkg patch from arago to meta-arago
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
X-List-Received-Date: Wed, 08 Aug 2012 02:31:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 01, 2012 at 10:35:50PM +0000, Cooper Jr., Franklin wrote:
> Denys,
> 
> The sole purpose of this patch is to port over a patch that you created in 
> arago. I didn't see any comments or change of status to your patch 
> submission (http://code.google.com/p/opkg/issues/detail?id=63). I did see a 
> brief discussion of your patch here 
> (https://groups.google.com/forum/?fromgroups#!topic/opkg-devel/6ZIXY8ESwek)  
> Do you want to drop this patch, keep carrying this patch in meta-arago or 
> maybe push it to oe-core? 

Well, if it hasn't been accepted upstream, we do need this patch for any sort 
of external scripts to work properly - e.g. manifest generation or similar.

-- 
Denys

