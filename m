Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C1EDA52099
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 01:55:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8O1tVls004049;
	Mon, 23 Sep 2013 20:55:31 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O1tUu7021515;
	Mon, 23 Sep 2013 20:55:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 23 Sep 2013 20:55:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O1tUkb018056;
	Mon, 23 Sep 2013 20:55:30 -0500
Date: Mon, 23 Sep 2013 21:55:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brad Litterell <brad@evidence.com>
Message-ID: <20130924015529.GF4390@edge>
References: <E51394554A503C4E852F9BEE46B03E8DF02E5B@TI-ODIN.tasernet.com>
MIME-Version: 1.0
In-Reply-To: <E51394554A503C4E852F9BEE46B03E8DF02E5B@TI-ODIN.tasernet.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Building Arago without a external toolchain?
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
X-List-Received-Date: Tue, 24 Sep 2013 01:55:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 24, 2013 at 01:28:02AM +0000, Brad Litterell wrote:
> Is it possible to build an arago system and get a toolchain build as well, 
> instead of an external toolchain?
> 
> If I don't have an external toolchain, I receive ERROR: No valid toolchain 
> in PATH.
> 
> I'd like to do this because that latest version of Yocto works without the 
> external toolchain and the system runs cleanly in qemu, but I'm having 
> trouble getting a build that runs under qemu with the linaro toolchain.

Brad,

As easy as:

TOOLCHAIN_TYPE=internal bitbake blah

Or set it in your local.conf or arago.conf...

-- 
Denys

