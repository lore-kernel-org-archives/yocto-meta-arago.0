Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D3DEA529A6
	for <meta-arago@arago-project.org>;
	Thu, 12 Jun 2014 20:15:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5CKFcPX026429
	for <meta-arago@arago-project.org>; Thu, 12 Jun 2014 15:15:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5CKFcO7021331
	for <meta-arago@arago-project.org>; Thu, 12 Jun 2014 15:15:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Jun 2014 15:15:37 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5CKFYQO016611;
	Thu, 12 Jun 2014 15:15:35 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Jun 2014 15:15:30 -0500
Message-ID: <1402604130-27374-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [tisdk-setup-scripts][PATCH] create-sdcard.sh: Use export LANG setting
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
X-List-Received-Date: Thu, 12 Jun 2014 20:15:39 -0000
Content-Type: text/plain

* Force locale language to be set to English this allows the script to run
* properly on a Linux OS whose default language isn't English.
---
 create-sdcard.sh |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 3e02050..85fefbf 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -36,6 +36,10 @@
 # OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# Force locale language to be set to English. This avoids issues when doing
+# text and string processing.
+export LANG=C
+
 # Determine the absolute path to the executable
 # EXE will have the PWD removed so we can concatenate with the PWD safely
 PWD=`pwd`
-- 
1.7.0.4


