Return-Path: <gleym-meta-arago@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by arago-project.org (Postfix) with ESMTPS id 626DD52090
	for <meta-arago@arago-project.org>;
	Thu, 17 Oct 2013 22:40:05 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gleym-meta-arago@m.gmane.org>) id 1VWwEd-0002DP-TZ
	for meta-arago@arago-project.org; Fri, 18 Oct 2013 00:40:04 +0200
Received: from sjce-dmz-wsa-4.cisco.com ([173.36.196.9])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <meta-arago@arago-project.org>; Fri, 18 Oct 2013 00:40:03 +0200
Received: from rmsrox by sjce-dmz-wsa-4.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <meta-arago@arago-project.org>; Fri, 18 Oct 2013 00:40:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: meta-arago@arago-project.org
From: Ranjeet <rmsrox@yahoo.co.in>
Date: Thu, 17 Oct 2013 22:35:13 +0000 (UTC)
Message-ID: <loom.20131018T003328-302@post.gmane.org>
References: <4F9216F96E5DF9428610502835A9F49054936128@DLEE11.ent.ti.com>
	<20130628175356.GD32141@edge>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 173.36.196.9 (Mozilla/5.0 (Windows NT 6.1;
	WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69
	Safari/537.36)
Subject: Re: Help needed: (Resend) Failures with nbench
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
X-List-Received-Date: Thu, 17 Oct 2013 22:40:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> Denys Dmytriyenko <denys@...> writes:
 From your description of the problem it looks like a race condition. You 
can try adding this line to the recipe to force building nbench package in a 
single thread - see if it helps:
> 
> PARALLEL_MAKE = ""
> 

Adding 
PARALLEL_MAKE = ""

worked for me! Thanks :)



