Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 1C6ED529D8
	for <meta-arago@arago-project.org>;
	Mon, 18 Feb 2013 17:43:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIF00EECFVQBV60@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 18 Feb 2013 11:43:18 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EDF4920531; Mon,
	18 Feb 2013 12:43:01 -0500 (EST)
Date: Mon, 18 Feb 2013 12:43:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130218174301.GA6546@denix.org>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-7-git-send-email-fcooper@ti.com>
	<CA+edY+TJcTewZLGNf5WTjsZE3a+3cg0UCRBjaHPhtFQ344iM8Q@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C3946F1@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C3946F1@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
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
X-List-Received-Date: Mon, 18 Feb 2013 17:43:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 18, 2013 at 03:14:17PM +0000, Cooper Jr., Franklin wrote:
> Hi Paul,
> 
> In this case ?= and = would be equivalent. If your setting SUPPORTS_SGX in 
> your local.conf then it will override the value in the arago.conf file.

Not really - distro conf always overrides local.conf. You'd need to use 
_forcevariable override in local.conf to make it work:

SUPPORT_SGX_forcevariable = "blah"

But, anyway, I'd rather work on extending MACHINE_FEATURES with "sgx" instead.

-- 
Denys


> I do see your point for the other two recipes. Currently it isn't friendly 
> for people wanting to support am3352.  I'll send updated patches. Thanks!
> 
> From: Paul Kovitz [mailto:paul.kovitz@welchallyn.com]
> Sent: Friday, February 15, 2013 6:26 PM
> To: fcooperjr27@gmail.com
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
> 
> Please comment on coding SUPPORTS_SGX ?= "YES" instead of SUPPORTS_SGX = "YES" For example, if you want to simulate an AM3352 device on an AM335x eval board, you could write SUPPORTS_SGX = "NO" in local.conf. This change requires a base_conditional checks for SUPPORTS_SGX in task-arago-tisdk-matrix.bb<http://task-arago-tisdk-matrix.bb> and task-arago-tisdk-graphics-sdk-target.bb<http://task-arago-tisdk-graphics-sdk-target.bb> to avoid other dependencies on OpenGL for the AM3352. I have a similar patch in the code I am currently using for my own development.
> 
> Thanks for your help.
> 
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


