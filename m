Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id CF16452090
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 19:40:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OJdxTe027128
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 14:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493062799;
	bh=F5LvYPgaAsqeRRtyQqlswj6QPRU4Cdc3ZnfYVoj0OGI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vwWQ8IXtEZcvZOKxmJTjXVxHSOjY/YzlMWEeElUNBzErk4+T8RgoV1zctSgN4Z4UE
	xhWYLnjGj3EpXMqCxupu3xhtrUYhUwvyzcefBeu88NNEwu69xbu73q6Fa17f1PbFl/
	AW0IgKAlIZta/ar8OWuvTYq3QStLqVc20Zx8RNnI=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OJdsI4020140
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 14:39:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 14:39:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OJdsRi022607;
	Mon, 24 Apr 2017 14:39:54 -0500
Date: Mon, 24 Apr 2017 15:39:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170424193953.GA30097@edge>
References: <20170424161757.9391-1-dmurphy@ti.com>
	<20170424171337.GB24846@edge>
	<c8957f46-9794-8e85-e6d5-8b346ae18005@ti.com>
MIME-Version: 1.0
In-Reply-To: <c8957f46-9794-8e85-e6d5-8b346ae18005@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] linaro-optee: Update to v2.4.0 OPTEE release
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
X-List-Received-Date: Mon, 24 Apr 2017 19:40:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, we have corresponding bbappends - I see you already sent a patch.

On Mon, Apr 24, 2017 at 02:04:40PM -0500, Dan Murphy wrote:
> Denys
> 
> Yeah you are correct.
> 
> Do we have TI override OPTEE recipes?
> 
> Dan
> 
> On 04/24/2017 12:13 PM, Denys Dmytriyenko wrote:
> > Dan,
> > 
> > This looks like a patch against Linaro's meta-optee - the right list would be openembedded@lists.linaro.org
> > 
> 
> 
> -- 
> ------------------
> Dan Murphy

