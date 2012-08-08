Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id B74E252A5A
	for <meta-arago@arago-project.org>;
	Wed,  8 Aug 2012 02:29:12 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8F005L5085SQN4@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Aug 2012 21:28:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BB076201B7; Tue,
	07 Aug 2012 22:28:53 -0400 (EDT)
Date: Tue, 07 Aug 2012 22:28:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120808022853.GB32275@denix.org>
References: <8F29D6B095ED194EA1980491A5E029710C27EB98@DFLE30.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C27EB98@DFLE30.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] curl: Disable crypto related features
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
X-List-Received-Date: Wed, 08 Aug 2012 02:29:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 01, 2012 at 10:41:22PM +0000, Cooper Jr., Franklin wrote:

It's hard to comment on the patch when it's not inline...

> +# Disable all crypt support in curl due to export restrictions

We no longer have export restrictions on cryptography, why do we need to 
disable it completely?

-- 
Denys

