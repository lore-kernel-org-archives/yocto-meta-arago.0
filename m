Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BD07152A0E
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 15:52:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DFqXTu032027
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 10:52:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DFqX8d008144
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 10:52:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 10:52:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DFqXgN006009;
	Fri, 13 Jun 2014 10:52:33 -0500
Date: Fri, 13 Jun 2014 11:52:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140613155232.GB2311@edge>
References: <1402604130-27374-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1402604130-27374-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts][PATCH] create-sdcard.sh: Use export LANG setting
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
X-List-Received-Date: Fri, 13 Jun 2014 15:52:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 12, 2014 at 03:15:30PM -0500, Franklin S. Cooper Jr wrote:
> * Force locale language to be set to English this allows the script to run
> * properly on a Linux OS whose default language isn't English.

Missing SOB line.

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  create-sdcard.sh |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index 3e02050..85fefbf 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -36,6 +36,10 @@
>  # OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
>  # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>  
> +# Force locale language to be set to English. This avoids issues when doing
> +# text and string processing.
> +export LANG=C
> +
>  # Determine the absolute path to the executable
>  # EXE will have the PWD removed so we can concatenate with the PWD safely
>  PWD=`pwd`
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

